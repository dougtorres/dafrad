file = File.open("alunos.csv", "r")
contents = file.read

contents = contents.split("\n")

theader = "<thead><tr><th>"
theader += contents.shift.gsub(";", "</th><th>")
theader += "</th></tr></thead>"

tbody = "<tbody>"
tbody += contents
  .map{|e|e.downcase}
  .sort
  .map{|row|
    "<tr><td>"+row.gsub(";", "</td><td>")+"</td></tr>"
  }
  .join
tbody += "</tbody>"

puts "<table>#{theader+tbody}</table>"
