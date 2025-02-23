# IIT Mandi Campus Marketplace 
  Description :
       This mobile application provides a dedicated platform for students, faculty, and staff to buy, sell, or exchange items within their university campus.
       Unlike social media or word-of-mouth methods, this app offers a structured and secure way to connect buyers and sellers.
  Features :
       Core Features :
            User Authentication – Email/Password & OTP verification via Email
            Search & Filters – Easily find relevant listings
            Trusted Community – Only verified university members can join
       Enhanced Features :
            Notification System – Real-time push notifications for new messages or offers
            In-app Chat – Private messaging without sharing phone numbers
            Rating & Review System – Users can rate and review sellers to build trust
            Security & Trust – Features to handle potential scams or misuse.If the reviews are constantly bad for user, it will lead to banning of the user.
       Performance & Scalability :
            Smooth Image Handling – Optimized for fast image uploads and retrieval
            Real-time Notifications – Minimal delay for chat updates and new offers
            Efficient Data Management – Quick loading times with database optimization
  App Pages & Navigation Flow :
       Login Page :
            The first page the user interacts with and it contains:
                Email & Password Fields – For user authentication.
                Login Button – If the user enters valid credentials, they are redirected to the Home Page.
                Sign Up Button – Navigates to the Sign Up Page for new users.
       Sign Up Page :
            Allows new users to create an account and it contains :
                User Input Fields – Email, Password, Confirm password, signup button and a login button (brings the user back to the login page)
                Signup Button – Redirects to the Profile Info Page to enter the credentials - First name, Last name, contact number, age, gender, location (north/south) and profile photo (optional)
                The profile info page contains : 
                    Submit button - Redirect to home page.
                    Skip Button – Allows users to proceed without a profile picture.
       Home Page :  
            The main hub for browsing and interacting with the marketplace and it contains :
                Search Bar – Allows users to find items.
                Item Listings – Displays items available for purchase and it links to Buy Item Page
                Bottom Navigation Bar – Links to :
                    Sell Item Page
                    Profile Page
                    Chat Page
                    My Ads Page
            Buy Item Page :
                Displays item details, seller information, and options to purchase and this page contains :
                    Item Image & Title
                    Seller Details – Profile picture, name, and rating.
                    Description & Price
                    Address
                    Chat Button – Redirects to Chat Page to communicate with the seller.
       Chat Page :    
            Facilitates communication between buyers and sellers and contains :
                    Chat Box – Shows message history.
                    Input Field – Type and send messages.
                    Report Button – Allows users to report abuse, spam, or harassment.
       Sell Item Page :
            Allows users to list items for sale and it contains :
                    Image Upload Section
                    Price Input
                    Category Dropdown
                    Title & Description Fields (limited to 50 words)
                    Submit Button – Adds the item to the marketplace.
       My Ads Page :   
            Shows all the items listed by the user.
            Allows removing ads.
       Profile Page :
            Displays user details and their listed items, it contains :
                    Profile Picture & Name
                    Email & Contact Number
                    Listed Items
                    User Rating
                    Change Password Option
                    Logout Button
                    Additional Features :
                        View Rulebook & Guidelines
                        Rate the App            
       Report Page :  
            Accessible from the Chat Page via the three-dot menu, it contains :
                    Abuse, Harassment, and Spam Options
                    Submit Button – Sends the report to the admin.

Installation & Setup :
    Backend Setup :
          Clone the repository
          Install dependencies
          Set up environment variables (create a .env file)
          Start the server
    Frontend Setup :
          Navigate to the frontend directory
          Install dependencies
          Configure environment settings if needed.
          Run the app via main.dart
Prerequisites :
     Ensure you have the following installed before hand :
          Flutter SDK (for Flutter frontend)
          Android Studio/Xcode (for native app development)
          Git 
