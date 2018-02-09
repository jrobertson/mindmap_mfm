!#/usr/bin/env ruby

# file: mindmap_mfm.rb


require 'martile'
require 'kramdown'
require 'mindmapdoc'
require 'html-to-css'


class MindmapMFM

  def initialize(s)

    @rawdoc = build_rawdoc(s)
    @html = Kramdown::Document.new(@rawdoc).to_html

  end  
  
  # Returns an HTML-to-CSS object
  #
  def to_htc()
    HtmlToCss.new(@html)
  end
  
  def to_html(cssfile: nil)
    
    html = if cssfile then
    
      doc = Rexle.new(@html)
      link = Rexle::Element.new('link')
      link.attributes.merge!(rel: 'stylesheet', href: cssfile)
      doc.root.element('head/style').insert_after(link)
      doc.xml(declaration: 'none')
      
    else
      @html
    end
    
    "<!DOCTYPE html>\n" + html
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
      svg + div {float: right; width: 50%; overflow-y: auto; height: 70vh}
    </style>
  </head>
EOF
    
    
    a = s.split(/(?=__DATA__)/,2)
    a2 = a.first.split(/(?=!s)/,2)
    svg = a2[1].lines.first
    txtdoc = a2[1].lines[1..-1].join

    divdoc = if txtdoc[0] != '<' then 
      actual_txtdoc, below_txtdoc = txtdoc.split(/-{10,}/,2)
      '<div markdown="1">' + actual_txtdoc \
                    + "</div>\n<div style='clear: both'/>\n" + below_txtdoc
    else
      txtdoc
    end
                    
    html = [
      "<html>\n", 
      head, 
      "\n  <body markdown='1'>\n\n", 
      a2[0], 
      svg, 
      "\n\n", divdoc, "\n</body>\n</html>\n\n", 
      a.last
    ].join

    Martile.new(html).to_s

  end

end
