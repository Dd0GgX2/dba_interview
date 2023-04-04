module Visibility
	class Data_Fix_KPIs_Job < BaseJob

		def run(context)

			fixes = Array.new
			monitor_client = DatabaseClient.for_monitor_database
			email_content = String.new

			#FILL DATA SETS

			data_integrity_sql = 	"SELECT c.check_name as check_name, count(*) as count
									FROM DataIntegrity_Issues issue (nolock) 
									INNER JOIN DataIntegrity_DataChecks c (nolock) on issue.datacheck_id = c.datacheck_id
									WHERE occurrence_date BETWEEN cast(dateadd(day, - 7, getdate()) AS DATE)
										AND cast(getdate() AS DATE)
									GROUP BY c.check_name
									ORDER BY count DESC"
			

		 	monitor_client.execute(data_integrity_sql).each do |issue|
				fixes << {monitoring_tool: "Data Integrity", check_name: issue['check_name'], count: issue['count']}
			end

			ae_data_integrity_sql = "SELECT task_name, count(*) as count
									FROM DataIntegrity_AE_Tasks
									WHERE occurrencedate BETWEEN cast(dateadd(day, - 7, getdate()) AS DATE)
									AND cast(getdate() AS DATE)
									AND task_name <> 'Unprocessed_Credit_Cards.sql'
									GROUP BY task_name
									ORDER BY count DESC"

			monitor_client.execute(ae_data_integrity_sql).each do |issue|
				fixes << {monitoring_tool: "Account Data Integrity", check_name: issue['task_name'], count: issue['count']}
			end

			overcredit_sql = "SELECT description as task_name, count(*) as count
									FROM Display_Error_Monitoring
									WHERE occurrencedate BETWEEN cast(dateadd(day, - 7, getdate()) AS DATE)
											AND cast(getdate() AS DATE)
									GROUP BY description
									ORDER BY count DESC"

			monitor_client.execute(overcredit_sql).each do |issue|
				fixes << {monitoring_tool: "Overcredits", check_name: issue['task_name'], count: issue['count']}
			end

			data_integrity = fixes.select{|record| record[:monitoring_tool] == "Data Integrity"}
			ae_integrity = fixes.select{|record| record[:monitoring_tool] == "Account Data Integrity"}
			financial_integrity = fixes.select{|record| record[:monitoring_tool] == "Overcredits"}

			summary_html = "<table cellpadding='12'>"

			# GENERAL DATA INTEGRITY

			data_integrity_count = 0
			data_integrity_html = "<p><u>General Data Integrity Fixes</p></u>"
			data_integrity_html += "<table cellpadding='12'>"

			data_integrity.each do |check|
				data_integrity_count += check[:count]
				data_integrity_count += check[:count]
				data_integrity_html += "<tr><td>#{check[:check_name]}</td><td>#{check[:count]}</td></tr>"
			end
			data_integrity_html += "</table>"
			data_integrity_html += "<a href=\"https://bitbucket.org/test/monitoring-service/src/d4e7f6fc6164969626149b3f9223926074f3d506/lib/jobs/data_integrity/sql/?at=master\" style=\"text-decoration:none\">BitBucket Link</a>"
			summary_html += "<tr><td>General Data Integrity Fixes</td><td>#{data_integrity_count}<td></td></tr>"

			#ACCOUNT ENTRY INEGRITY

			ae_integrity_count = 0
			ae_integrity_html = "<p><u>Account Integrity Fixes</p></u>"
			ae_integrity_html += "<table cellpadding='12'>"
			ae_integrity.each do |check|
				ae_integrity_count += check[:count]
				ae_integrity_count += check[:count]
				ae_integrity_html += "<tr><td>#{check[:check_name]}</td><td>#{check[:count]}</td></tr>"
			end
			ae_integrity_html += "</table>"
			ae_integrity_html += "<a href=\"https://bitbucket.org/test/monitoring-service/src/d4e7f6fc6164969626149b3f9223926074f3d506/lib/jobs/data_integrity/ae_sql_detail/?at=master\" style=\"text-decoration:none\">BitBucket Link</a>"
			summary_html += "<tr><td>Account Entry Integrity Fixes</td><td>#{ae_integrity_count}<td></td></tr>"

			#FINANCIAL INTEGRITY

			financial_integrity_count = 0
			financial_integrity_html = "<p><u>Financial Integrity Fixes</p></u>"
			financial_integrity_html += "<table cellpadding='12'>"
			financial_integrity.each do |check|
				financial_integrity_count += check[:count]
				financial_integrity_count += check[:count]
				financial_integrity_html += "<tr><td>#{check[:check_name]}</td><td>#{check[:count]}</td></tr>"
			end
			financial_integrity_html += "</table>"
			financial_integrity_html += "<a href=\"https://bitbucket.org/test/monitoring-service/src/d4e7f6fc6164969626149b3f9223926074f3d506/lib/jobs/production_support/display_error_sql/?at=master\" style=\"text-decoration:none\">BitBucket Link</a>"
			summary_html += "<tr><td>Financial Integrity Fixes</td><td>#{financial_integrity_count}<td></td></tr>"
			summary_html += "</table>"

			#FILL EMAIL

			total = data_integrity_count + ae_integrity_count + financial_integrity_count

			email_content = "<center>
							<H2>Database Activity Report - Last 7 Days</H2>
							<br>
							<p><b><font size='30'color='red'>#{total}</font></b></p>
							<br>
							<H3>Manual Data Write Summary</H3>
							<br>
							#{summary_html}
							<br>
							<br>
							<br>
							<H3>Manual Data Write Detail</H3>
							<br>
							#{data_integrity_html}
							<br>
							<br>
							<br>
							<br>
							#{ae_integrity_html}
							<br>
							<br>
							<br>
							<br>
							#{financial_integrity_html}"

			email_helper("test@test.com", " Database Activity Report", email_content, from='Monitoring-Service@test.com') unless email_content.empty?
							
		end
	end
end
