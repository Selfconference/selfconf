@SimpleFormatMixin =
  simpleFormat: (str) ->
    str ||= ""
    str = str.replace(/\r\n?/, "\n")
    str = s.trim(str)
    unless s.isBlank?(str)
      str = str.replace(/\n\n+/g, '</p><p>')
      str = str.replace(/\n/g, '<br />')
      str = "<p>#{str}</p>"
    str
