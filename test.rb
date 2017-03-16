#!/usr/bin/ruby -w

#puts "How much did you earn last month"
#earnings = gets.chomp
#puts "how much money did you spend last month"
#spendings = gets.chomp
#overall = earnings.to_i - spendings.to_i

#puts earnings.to_s + " " + " -" + spendings.to_s + " " + overall.to_s

File.open('money.csv' , 'r') do |the_file|
	lines = the_file.readlines.map do |line| #already splits lines
		line.chomp.gsub(/"/,"").split(";")
			#
	end

	lines = lines [1..-1]
	spent_total = ''
	earned_total = ''
	overall = ''
	
#	hash { 'selgitus' => line[4]}
	lines.each do |line|
#	puts lines

		if line[4] == 'Algsaldo'
#			puts lines.inspect 
				# gives me back a string, how the object actually looks
			overall = overall.to_f + line [5].to_f

			puts "overall #{overall}"
		  next #jumps out of the block
		end

		if line[7] == 'D' # && line[4] != 'Käive' && line[4] != 'lõppsaldo' 

			spent_total = spent_total.to_f + line [5].to_f
		else 

			earned_total = earned_total.to_f + line[5].to_f
		end
		
#		overall = overall.to_f - (earned_total.to_f - spent_total.to_f)
		overall = overall.to_f - spent_total.to_f + earned_total.to_f

	end

#	hash = {key:value}
#	summa = hash[:Selgitus]
	

	puts " You spent #{spent_total}"
	puts " You earned #{earned_total}"
	puts " your new overall is #{overall}"

end
