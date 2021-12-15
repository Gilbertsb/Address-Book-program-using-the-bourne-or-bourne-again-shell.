#Developed by Gilbert SIBOMANA Git: Gilbertsib
#THE PROGRAM IS ABOUT ADDRESS BOOK 
#---------------------------------

function add(){
    read -p "Enter Name: "  name                  #taking user input
    read -p "Enter Surname: "  sur_nam            #taking user input
    read -p "Enter Phone number: "  phone          #taking user input
    read -p "Enter Email: "  email                 #taking user input

    echo "$sur_nam Names [$name $sur_nam]">>datafile.txt         #adding user input to the file
    echo "$sur_nam Phone [+250] $phone">>datafile.txt            #adding user input to the file
    echo "$sur_nam Email [$email]">>datafile.txt                 #adding user input to the file
    echo "################################# |=====================||">>datafile.txt        #adding line to separate records in the file

    

}
function search(){

    read -p "Search by Surname: "  ser             #taking user input
    
    if grep "$ser" datafile.txt; then              #checking if surname exist in datafile
       echo "------------------------"

    else                                                    #in case surname does not exist in datafile
      echo "Surname you are looking for does not exist" 
    fi


}
function Edit(){
    read -p "Search by Surname: "  sered                       #taking user input    

    if grep -E "$sered" datafile.txt; then                       #checking if surname exist in datafile
      read -p "Do you want to Edit this Record(Y/N): "  yn                
      if [ $yn = "Y" ] || [ $yn = "y" ]; then                   #in case user choose y or y
         read -p "Enter New Name: "  name                      #taking new user input
         read -p "Enter New Surname: "  sur_nam                 #taking new user input
         read -p "Enter New Phone number: "  phone             #taking new user input
         read -p "Enter New Email: "  email                     #taking new user input

         sed -i -e "s/.*$sered Names.*/$sur_nam Names [$name $sur_nam]/" datafile.txt      #edit name with sed command
         sed -i -e "s/.*$sered Phone.*/$sur_nam Phone [+250] $phone/" datafile.txt         #edit phone with sed command
         sed -i -e "s/.*$sered Email.*/$sur_nam Email [$email]/" datafile.txt              #edit email with sed command
        
      
         echo Records Edited successful 
      elif [ $yn = "N" ] || [ $yn = "n" ]; then                #in case user choose n or N
         echo "OK"
      else 
         echo "Please choose Y/N"                             #in case user didn't choose either Y/N
      fi
    else
      echo "Surname you are looking for does not exist"             #in case user enter unavailable surname
    fi 


}
function remove(){
    read -p "Search by Surname: "  serre             #taking user input

    if grep -E "$serre" datafile.txt; then           #checking if surname exist in datafile
      read -p "Do you want to remove this Record(Y/N): "  yn  #getting user input
      if [ $yn = "Y" ] || [ $yn = "y" ]; then          #in case user choose y or y
        sed -i "/$serre/d" datafile.txt                  #removing records with sed command
        echo Records removed successful 
      elif [ $yn = "N" ] || [ $yn = "n" ]; then       #in case user choose n or N
        echo "OK"
      else 
        echo "Please choose Y/N"           #in case user didn't choose either Y/N
      fi
    else
      echo "Surname you are looking for does not exist"     #in case user enter unavailable surname
    fi 


}

function display()             #defining display function
{
   
   awk '{print $2, $3, $4 }' datafile.txt         #using awk command to display all records
                                                                             
}

function menu()                  #defining menu function
{
    echo =========================
    echo 1. Add Entries    
    echo 2. Display all Records      
    echo 3. Search Address Book   
    echo 4. Edit Entries         
    echo 5. Remove Entries       
    echo =========================

    read -p "Enter number of your choice(ex: 1): "  choice

    if [ $choice = "1" ]; then
       add                        #calling add function
    elif [ $choice = "2" ]; then
       display                      #calling display function
    
    elif [ $choice = "3" ]; then
       search                      #calling search function

    elif [ $choice = "4" ]; then
       Edit                       #calling edit function

    elif [ $choice = "5" ]; then
       remove                    #calling remove  function

    else
       echo "Check the menu again please"

    fi

}



menu     #calling menu function
while :  #endless loop
do
    
    read -p "If you want to CONTINUE enter Y and if  you want to EXIT enter N :  "  y  # prompting user to select Yes to continue or No to exit
    
    if [ $y = "Y" ] || [ $y = "y" ]; then      #checking if user choose yes
       menu                                   #Calling menu function
    elif [ $y = "N" ] || [ $y = "n" ]; then    #checking if user choose no
       exit 0                          #calling exit 
    else
       echo "Please choose (Y/N)"
    fi
done
