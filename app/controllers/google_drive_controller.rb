class GoogleDriveController < ApplicationController
  require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md

def index 
  byebug
  path = File.join Rails.root, 'config', 'my_service_account.json'
  session = GoogleDrive::Session.from_service_account_key(path)
  session.files.each do |file|
    p file.title
    byebug
  end

  file = File.join Rails.root, 'config', 'my_service_account.json'
  byebug
end 

def create
  path = File.join Rails.root, 'config', 'my_service_account.json'
  session = GoogleDrive::Session.from_service_account_key(path)
  byebug 
  # session.upload_from_io(params['image'], title='test_picture')

end 

# Gets list of remote files.

# # Uploads a local file.
# session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

# # Downloads to a local file.
# file = session.file_by_title("hello.txt")
# file.download_to_file("/path/to/hello.txt")

# # Updates content of the remote file.
# file.update_from_file("/path/to/hello.txt")
end 