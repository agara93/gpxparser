require 'nokogiri'
 
      file = File.open("gpx.xml")
      doc = Nokogiri::XML(file)
      doc.remove_namespaces!
      puts " "
      puts "======================================"
      puts doc.at_css('/*/name').text + " (GPX Data)"
      puts "======================================"
      puts doc.at_css('/*/desc').text
      puts " "
      puts "=========="
      puts "Waypoints"
      puts "=========="
      trackpoints = doc.xpath('//wpt[@*]')
      count = 0
      trackpoints.each do |trkpt|
            count += 1
            puts " "
            puts "id 	   = #{count}"
            puts "lat 	   = " + trkpt.at_xpath('@lat')
            puts "lon 	   = " + trkpt.at_xpath('@lon')
            if elev = trkpt.at_css('/ele')
                puts "ele 	   = #{elev.text}"
            else
                trkpt.next
            end
            if name = trkpt.at_css('/name')
                puts "name 	   = #{name.text}"
            else
                trkpt.next
            end
            if desc = trkpt.at_css('/desc')
                puts "desc 	   = #{desc.text}"
            else
                trkpt.next
            end
            if time = trkpt.at_css('/time')
                puts "created at = #{time.text}"
            else
                print " "
            end
            puts " "
      end
 
     

