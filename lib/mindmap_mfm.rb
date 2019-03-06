!#/usr/bin/env ruby

# file: mindmap_mfm.rb


require 'martile'
require 'kramdown'
require 'mindmapdoc'
require 'html-to-css'


class MindmapMFM
  using ColouredText

  def initialize(s, cssfile: nil, debug: false, footer: '')

    @s, @cssfile, @footer, @debug = s, cssfile, footer, debug
    puts ('footer: ' + @footer.inspect).debug if debug
  end  
  
  # Returns an HTML-to-CSS object
  #
  def to_htc()
    HtmlToCss.new(@html)
  end
  
  def to_html()
    
    if @debug then
      puts 'MindmapMFM | inside to_html()'.info
      puts ('@s: ' + @s.inspect).debug
    end
    
    @rawdoc = build_rawdoc(@s)
    @html = Kramdown::Document.new(
      @rawdoc.gsub(/\b'\b/,"{::nomarkdown}'{:/}")).to_html    
    
    html = if @cssfile and @cssfile.length > 1 then
    
      doc = Rexle.new(@html)
      link = Rexle::Element.new('link')
      link.attributes.merge!(rel: 'stylesheet', href: @cssfile)
      doc.root.element('head').add(link)
      doc.xml(declaration: 'none')
      
    else
      @html
    end
    
    "<!DOCTYPE html>\n" + html
  end  
  
  private

  def build_rawdoc(s)


css=<<EOF
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
EOF
                    
head =<<EOF
  <head>
    #{css unless @cssfile}
  </head>
EOF
    
    
    a = s.split(/(?=__DATA__)/,2)
                    
    body = if a.length > 1 then
                    
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
                      
      [
        a2[0], 
        svg, 
        "\n\n", divdoc, 
        ].join

    else
      s
    end
                    
    puts ('body: ' + body.inspect).debug if @debug
                    

    r = Martile.new(body, debug: false).to_s
    puts ('r: ' + r.inspect).debug if @debug

    html = [
      "<html>\n", 
      head, 
      "\n  <body markdown='1'>\n\n", 
      r,
      "<div id='footer'>",@footer, "</div>",
      "\n</body>\n</html>\n\n"
    ]    
                    
    html << a.last if a.length > 1
    html.join                

  end

end
