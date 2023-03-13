# README
* Ruby version: 3.2.0
* Rails version: 7.0.4.2

* System dependencies: memchached
  * On linux machines: sudo apt install memcached
  * on Mac: brew install memcached

* Configuration:
  * git clone git@github.com:wyodeb/simple_sms.git
  * bundle (in project folder)
  
* Database creation:
  * rails db:create && rails db:migrate && rails db:seed

* Run the project:
  * rails s

* Endpoints (only post accepted):
  * /api/v1/authentication  - expects 2 params:
    * auth_id
    * username
    * -- This endpoint will return following an auth token for further requests.
    Token is to be used for bearer authorizations. Token expires after 24 hours
    
  * /api/v1/inbound/sms - expects 3 params:
    * from - string(6-16)
    * to - string(6-16)
    * text - string(1-2-)
  * /api/v1/outbound/sms - expects 3 params:
    * from - string(6-16)
    * to - string(6-16)
    * text - string(1-120)
* Annotations:
  * Any unlisted params will be ignored.
  * Each listed param is thoroughly filtered as per requirements 
  * In addition to the  required error messages I added as meaningful as possible status codes and tried to avoid unknown or unexpected errors
  * I tried to keep the code as clean as I could. 
  * Thank you for considering my application for this role.