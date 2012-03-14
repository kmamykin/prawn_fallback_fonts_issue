require 'prawn'

Prawn::Document.generate "fallback_fonts.pdf" do
  font_families.update("DroidSansFallback" => {
    :normal => { :file => "./DroidSansFallback.ttf", :font => "DroidSansFallback" }
  })
  font("Times-Roman") # just to see which font is actually being used, DroidSans is too close looking to Helvetica
  fallback_fonts([])
  text "fallback_fonts is empty, :style=>:bold works"
  text "Some text that is not bold", :size => 40
  text "Some text that should be bold", :style => :bold, :size => 40
  fallback_fonts(["DroidSansFallback"])
  text "fallback_fonts is DroidSansFallback, :style=>:bold does not work"
  text "Some text that is not bold", :size => 40
  # The following text is drawn normal style, even though the fallback font is not even used
  text "Some text that should be bold", :style => :bold, :size => 40 

  move_down 20
  font "DroidSansFallback" do
    text "Some text in DroidSansFallback", :size => 30
  end
end
