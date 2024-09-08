require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']

region = 'us-west-1'
client = Aws::S3::Client.new

resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
        location_constraint: region
    }
})

# create randon from 1 6
number_of_files = 1 + rand(6)
# print the numeber of

puts "Number of files #{number_of_files}"

number_of_files.times.each do |i|
    
    puts "i: #{i}"
    # Create file with i name
    filename = "file_#{i}.txt"
    # Destination for file 
    output_path = "/tmp/#{filename}"
    
    # Write to file
    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid) # Write a random UUID to file
    end

    # Open and read the file in binary mode 'rb', then upload it to s3
    File.open(output_path, 'rb') do |f|
        client.put_object(              # Upload to s3
            bucket: bucket_name,        # Call bucket
            key: filename,              # Filename
            body: f,                    # File content from loop variable
        )
    end
end