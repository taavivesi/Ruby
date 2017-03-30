#!/usr/bin/ruby -w


module Bankaccount

#puts "How much did you earn last month"
#earnings = gets.chomp
#puts "how much money did you spend last month"
#spendings = gets.chomp
#overall = earnings.to_i - spendings.to_i

#puts earnings.to_s + " " + " -" + spendings.to_s + " " + overall.to_s
#ARGV.each do |file|
#	puts "Argument: #{a}"
#	end

#files_array = ARGV['money.csv','money2.csv']
#puts files_array
File.open('money.csv', 'r') do |the_file|
	lines = the_file.readlines.map do |line| #already splits lines
		line.chomp.gsub(/"/,"").split(";")
		
	end

	lines = lines [1..-1]
	$spent1_total = ''
	$earned1_total = ''
	overall1 = ''
	date = ''
	
#	hash { 'selgitus' => line[4]}
	lines.each do |line|

		if line[4] == 'Algsaldo'
#			puts lines.inspect 
				# gives me back a string, how the object 0actually looks
			overall1 = overall1.to_f + line [5].to_f

			puts "overall is #{overall1}"
			next #jumps out of the block
		end

		if line[2] == '01.03.2017'

			date = "March"
			next

			else if line[2] == '01.02.2017'
			date = "February"
			next

			else
			date = "January"
			end					
		end

		if line[7] == 'D' # && line[4] != 'Käive' && line[4] != 'lõppsaldo' 

			$spent1_total = $spent1_total.to_f + line [5].to_f
			else 

			$earned1_total = $earned1_total.to_f + line[5].to_f
		end	
	end
#		overall = overall.to_f - (earned_total.to_f - spent_total.to_f)
		overall1 = overall1.to_f - $spent1_total.to_f + $earned1_total.to_f

#	hash = {key:value}
#	summa = hash[:Selgitus]
	

	puts " You spent in #{date} #{$spent1_total}"
	puts " You earned in #{date} #{$earned1_total}"
	puts " your new overall in #{date}  is #{overall1}"
	puts " "

	end 

	File.open('money2.csv', 'r') do |the_file|
	lines = the_file.readlines.map do |line| #already splits lines
		line.chomp.gsub(/"/,"").split(";")
	end

	lines = lines [1..-1]
	$spent2_total = ''
	$earned2_total = ''
	overall2 = ''
	date = ''

	lines.each do |line|
	if line[4] == 'Algsaldo'
			overall2 = overall2.to_f + line [5].to_f
			puts "overall is #{overall2}"
			next 
	end

		if line[2] == '01.03.2017'

			date = "March"
			next

			else if line[2] == '01.02.2017'
			date = "February"
			next

			else
			date = "January"
			end					
		end

		if line[7] == 'D'

			$spent2_total = $spent2_total.to_f + line [5].to_f
			else 

			$earned2_total = $earned2_total.to_f + line[5].to_f
		end	
	end
		overall2 = overall2.to_f - $spent2_total.to_f + $earned2_total.to_f

	puts " You spent in #{date} #{$spent2_total}"
	puts " You earned in #{date} #{$earned2_total}"
	puts " your new overall in #{date}  is #{overall2}"
	puts " "

	end
	puts " your total spent is #{$spent1_total + $spent2_total}"
	puts " your total earned is #{$earned1_total + $earned2_total} "
end
