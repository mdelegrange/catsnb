class Cat < ApplicationRecord
    mount_uploader :photo, PhotoUploader
end
