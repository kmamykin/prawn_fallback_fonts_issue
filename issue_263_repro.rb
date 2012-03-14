# encoding: UTF-8
require 'prawn'
require 'prawn/measurement_extensions'

Prawn::Document.generate "fallback_fonts.pdf" do
  font_families.update("DroidSansFallback" => {
    :bold   => { :file => "./DroidSansFallback.ttf", :font => "DroidSansFallback" },
    :normal => { :file => "./DroidSansFallback.ttf", :font => "DroidSansFallback" }
  })
  font("Times-Roman") # just to see which font is actually being used, DroidSans is too close looking to Helvetica

  fallback_fonts([])
  text "fallback_fonts is empty, :style=>:bold works"
  text "Some text that is not bold", :size => 40
  text "Some text that should be bold", :style => :bold, :size => 40

  fallback_fonts(%W(DroidSansFallback))
  text "fallback_fonts is DroidSansFallback, :style=>:bold does not work"
  text "Some text that is not bold", :size => 40
  # The following text is drawn normal style, even though the fallback font is not even used
  text "Some text that should be bold", :style => :bold, :size => 40 

  text "using formatted_text_box works with fallback_fonts and :style=>:bold"
  formatted_text_box [
    {:text=>"Normal text ", :styles=>[:normal], :size=>30},
    {:text=>"Bold text 虫爬小个写事难么", :styles=>[:bold], :size=>30}],
    :at=>[0, 6.5.in], :width=>8.in, :height=>1.in
end
