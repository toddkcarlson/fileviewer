class Kmz < ApplicationRecord

   def import_from_kmz(file_name)
     # Implementation goes here
     # csv_text = File.read(file_name)
     # csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

     # csv.each do |row|
     #   row_hash = row.to_hash
     #   add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     # end     
   end

end