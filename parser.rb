require 'nokogiri'

    #waypoints
    
      fileway = File.open("waypoints.xml")
      doc = Nokogiri::XML(fileway)
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

      waypoints = doc.xpath('//wpt[@*]')
      count = 0
      waypoints.each do |wpt|
            count += 1
            puts " "
            puts "wpt id     = #{count}"
            puts "lat 	   = " + wpt.at_xpath('@lat')
            puts "lon 	   = " + wpt.at_xpath('@lon')
            if elev = wpt.at_css('/ele')
                puts "ele 	   = #{elev.text}"
            else
                wpt.next
            end
            if name = wpt.at_css('/name')
                puts "name 	   = #{name.text}"
            else
                wpt.next
            end
            if desc = wpt.at_css('/desc')
                puts "desc 	   = #{desc.text}"
            else
                wpt.next
            end
            if time = wpt.at_css('/time')
                puts "created at = #{time.text}"
            else
                print " "
            end
            puts " "
         end
         
        # routes
        
        filerte = File.open("routes.xml")
        docrte = Nokogiri::XML(filerte)
        docrte.remove_namespaces!
        puts " "
        puts "=========="
        puts "  Routes"
        puts "=========="
        
        route = docrte.xpath('//rte')
        countrte = 0
        route.each do |rte|
            countrte +=1
            puts " "
            puts rte.at_css('/name').text 
            puts "========================"
            puts rte.at_css('/desc').text
            puts " "
        
            routes = docrte.xpath('//rtept[@*]')
            countrtept = 0
            routes.each do |rtept|
                countrtept +=1
                puts "rte id     = #{countrtept}"
                puts "lat 	   = " + rtept.at_xpath('@lat')
                puts "lon 	   = " + rtept.at_xpath('@lon')
                if elev = rtept.at_css('/ele')
                    puts "ele 	   = #{elev.text}"
                else
                    rtept.next
                end
                if name = rtept.at_css('/name')
                    puts "name 	   = #{name.text}"
                else
                    rtept.next
                end
                if desc = rtept.at_css('/desc')
                    puts "desc 	   = #{desc.text}"
                else
                    rtept.next
                end
                if time = rtept.at_css('/time')
                    puts "created at = #{time.text}"
                else
                    print " "
                end
                puts " "
             end
         end
        
        puts " ======================"
        puts "    End of data     "
        puts " #{count} Waypoints "
        puts " #{countrte} Routes "
        puts " ======================"
        puts " "
 
     

