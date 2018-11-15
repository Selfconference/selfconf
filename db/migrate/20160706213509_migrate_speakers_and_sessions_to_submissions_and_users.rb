class MigrateSpeakersAndSessionsToSubmissionsAndUsers < ActiveRecord::Migration[5.2]
  class MigrationSubmissionUser < ActiveRecord::Base
    self.table_name = :submissions_users
  end

  class MigrationSubmission < ActiveRecord::Base
    self.table_name = :submissions
  end

  class MigrationUser < ActiveRecord::Base
    self.table_name = :users

    devise :database_authenticatable
  end

  class MigrationFeedback < ActiveRecord::Base
    self.table_name = :feedbacks

    belongs_to :submission, class_name: "MigrationSubmission", foreign_key: :submission_id
  end

  class MigrationSession < ActiveRecord::Base
    self.table_name = :sessions

    has_many :feedbacks, class_name: "MigrationFeedback", foreign_key: :session_id
  end

  class MigrationSpeaker < ActiveRecord::Base
    self.table_name = :speakers
  end

  class MigrationSessionSpeaker < ActiveRecord::Base
    self.table_name = :sessions_speakers

    belongs_to :speaker, class_name: "MigrationSpeaker"
  end

  def up
    MigrationSession.find_each do |session|
      sub = MigrationSubmission.where(event_id: session.event_id, talkname: session.name)
      if sub.count > 0
        sub = sub.first
        sub.update_attributes(selected: true,
                              room_id: session.room_id,
                              slot_id: session.slot_id,
                              keynote: session.keynote)
        associate_speakers(session, sub)
        associate_feedback(session, sub)
      else
        migrate_new(session)
      end
    rescue
      migrate_new(session)
    end
  end

  def down
  end

  def migrate_new(session)
    sub = create_submission(session)
    associate_speakers(session, sub)
    associate_feedback(session, sub)
  end

  def create_submission(session)
    MigrationSubmission.create!(talkname: session.name,
                                abstract: session.abstract,
                                talktype: "unknown",
                                event_id: session.event_id,
                                selected: true,
                                room_id: session.room_id,
                                slot_id: session.slot_id,
                                keynote: session.keynote)
  end

  def associate_speakers(session, sub)
    speaker_relations = MigrationSessionSpeaker.where(session_id: session.id)
    speaker_relations.each do |speaker_relation|
      speaker = speaker_relation.speaker
      matching_users = MigrationUser.where(name: speaker.name)
      if matching_users.count < 1
        user = MigrationUser.create!(name: speaker.name,
                                     email: "fixme#{speaker.id}@gmail.com",
                                     twitter: speaker.twitter,
                                     bio: speaker.bio,
                                     headshot: speaker.photo,
                                     password: "Ch@ng3M3",
                                     password_confirmation: "Ch@ng3M3")
        MigrationSubmissionUser.create!(user_id: user.id, submission_id: sub.id)
      else
        user = matching_users.first
        user.update_attributes!(bio: speaker.bio, headshot: speaker.photo, twitter: speaker.twitter)
        matching_relations = MigrationSubmissionUser.where(user_id: user.id, submission_id: sub.id)
        if matching_relations.count < 1
          MigrationSubmissionUser.create!(user_id: user.id, submission_id: sub.id)
        end
      end
    end
  end

  def associate_feedback(session, sub)
    session.feedbacks.each do |feedback|
      feedback.submission = sub
      feedback.save!
    end
  end
end
