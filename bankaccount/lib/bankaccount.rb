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
File.open('money1.csv', 'r') do |the_file|
	lines = the_file.readlines.map do |line| #already splits lines
		line.chomp.gsub(/"/,"").split(";")
	end

	lines = lines [1..-1]
	spent_total = ''
	earned_total = ''
	overall = ''
	date = ''
	
#	hash { 'selgitus' => line[4]}
	lines.each do |line|
#	puts lines

		if line[4] == 'Algsaldo'
#			puts lines.inspect 
				# gives me back a string, how the object 0actually looks
			overall = overall.to_f + line [5].to_f

			puts "overall is #{overall}"
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

			spent_total = spent_total.to_f + line [5].to_f
			else 

			earned_total = earned_total.to_f + line[5].to_f
		end	
	end
#		overall = overall.to_f - (earned_total.to_f - spent_total.to_f)
		overall = overall.to_f - spent_total.to_f + earned_total.to_f

#	hash = {key:value}
#	summa = hash[:Selgitus]
	

	puts " You spent in #{date} #{spent_total}"
	puts " You earned #{earned_total}"
	puts " your new overall is #{overall}"

	end
end
#ARGV to read all the files into the program
#Use more than one csv file 
#Give the money monthly and then the whole total 
