For our mobile applications (iPad, iPhone and Android) we have to serve up different image advertisements to each different device. Generally our advertisers purchase their space for a month of time, but at times can be for only set periods of times. Sometimes they order for all three devices and other times for only one or two. Finally, each advertisement has a specific URL that the user should go to when they click on the advertisement.
We need you to describe how you’d build a small application to serve up these advertisements. You don’t need to write line by line code, but be able to describe the architecture of the system from a high level.

Be prepared to describe:
● How would you serve up the mobile advertisements?

Serve ad assets like images them from a CDN like cloudflare
Serve html partials that will fill in a designated space on the web page

● How would the data for each advertisement be stored (i.e., what does the database look like)?
string :size
string :url
date :end_date
date :start_date
iphone :boolean
ipad :boolean
android :boolean
iphone_image_url :string
ipad_image_url :string
android_image_url :string
string :device_type (ipad, iphone, or android)


● How would you track how many times the advertisement has been viewed or clicked?
clicks model
int :advertisement_id (foreign_key)
string :ref_url

for this problem, probably just keep an accumulator on each advert int that is increased every time the add is served. For a real ap, I'd probably want to use a model so I can store / calculate more / aggregate information about the click.


An existing e-commerce system sells widgets to registered customers. The company has too much excess inventory. It wants to be able to offer discounts on certain products to certain customers, or certain groups of customers. How would you extend the schema below to support such an enhancement to the system? Existing schema has 2 tables : Users and Products 

Create new model + db table:

DiscountGroup int :discount, string :name, int :id
DiscountMember (join table b/w User & DiscountGroup) int :id, int :discount_group_id (foreign_key), int :user_id (foreign key)
