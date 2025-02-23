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
            
  Navigation Flow and Summary of Code:
  
       1. App Pages & Navigation Flow
    🔹 Login Page (login_page.dart)
            Email & Password Fields – User authentication via Firebase.
            Login Button – Redirects users to the Home Page upon success.
            Sign Up Button – Navigates to Sign Up Page for new users.
    🔹 Sign Up & Profile Setup
            Sign Up Page (signup_page.dart)

            Users must register using an IIT Mandi email.
            Fields: Email, Password, Confirm Password.
            OTP-based authentication using Brevo & Firestore.
            Redirects to Profile Info Page after OTP verification.
            Profile Info Page (prof_sign_page.dart)

            Users enter:
                First Name, Last Name, Contact, Age, Gender, Location (North/South).
                Profile Photo (Optional) – Can skip and proceed.
                Submit Button – Redirects to Home Page.
    🔹 Home Page (Main Marketplace Hub) (home_page.dart)
            Search Bar – Allows users to find items.
            Item Listings – Displays all items for sale (links to Buy Item Page).
            Bottom Navigation Bar:
                Sell Item Page (add_item_page.dart) – List new items.
                Profile Page (profile_page.dart) – View/edit user profile.
                Chat Page (chat_messages.dart) – Communicate with buyers/sellers.
                My Ads Page (myads_page.dart) – Manage listed items.
    🔹 Buy Item Page (Item Details & Seller Info) (item_info_page.dart)
            Displays full item details:
                Item Image & Title
                Seller Profile (Picture, Name, Rating)
                Item Description, Price, Seller Address
                Chat Button – Redirects to Chat Page to talk to the seller.
    🔹 Chat Page (Buyer-Seller Communication) (chat_messages.dart)
            Chat Box – Displays message history.
            Input Field – Users can type & send messages.
            Report Button – Allows users to report abuse, spam, or harassment.
    🔹 Sell Item Page (Post Listings) (add_item_page.dart)
            Allows users to list items for sale with:
            Image Upload (Compressed & stored as Base64).
            Price, Title, and Description (50-word limit).
            Submit Button – Adds item to Firestore.
    🔹 My Ads Page (Manage Listings) (myads_page.dart)
            Displays all items listed by the user.
            Allows users to delete ads from Firestore.
    🔹 Profile Page (User Account & Settings) (profile_page.dart)
            Displays user details & listed items.
            Contains:
                Profile Picture & Name.
                Email & Contact Number.
                User Rating.
                Change Password Option.
                Logout Button.
                Additional Features:
                View Rulebook & Guidelines.
                Rate the App.
    🔹 Report (Abuse & Spam Reporting) 
            Accessible from the Chat Page 
            Users can report abuse, harassment, and spam.
            Submit Button – Sends the report to the admin.
            
 Firebase Integration & Backend
   
     Firebase Authentication – Secure login & signup.
     Firestore Database – Stores user profiles, item listings, and chat messages.
     Real-time updates – Items, messages, and profile changes sync instantly.
     OTP Authentication via Brevo – Ensures secure user verification.



Setup and Run :
    
    Frontend Setup :
          Clone the repository
          Install dependencies
          Set up environment variables (save .env from drive)
          Run the app via main.dart
          
Prerequisites :

     Ensure you have the following installed before hand :
          Flutter SDK (for Flutter frontend)
          Android Studio (for native app development)
          Git 
