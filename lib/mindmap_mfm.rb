!#/usr/bin/env ruby

# file: mindmap_mfm.rb


require 'martile'
require 'kramdown'
require 'mindmapdoc'


class MindmapMFM

  def initialize(s)

    @rawdoc = build_rawdoc(s)

  end
  
  def to_html()
    Kramdown::Document.new(@rawdoc).to_html
  end  
  
  private

  def build_rawdoc(s)
    
head =<<EOF
  <head>
    <style>
      h2 {background-color: #ee2;}
      svg  {fill: #3ac;}
      a ellipse2 {fill: #3ac}
      a ellipse2:hover {fill: #3ac}
      g.link {fill: #314}
      g.node {fill: #311}
      a {fill: #114; }
      svg g a:hover {background-color: #3ac; }
      #doc {float: right; width: 50%; overflow-y: auto; height: 90%}
    </style>
  </head>
EOF
    
    
    a = s.split(/(?=__DATA__)/,2)
    a2 = a.first.split(/(?=!s)/,2)
    svg = a2[1].lines.first
    div = a2[1].lines[1..-1]

    html = [
      "<html>\n", 
      head, 
      "\n  <body markdown='1'>\n\n", 
      a2[0], 
      svg, 
      "<div markdown='1' id='doc'>\n\n", div, "</div>\n</body>\n</html>\n\n", 
      a.last
    ].join

    Martile.new(html).to_s

  end

end

