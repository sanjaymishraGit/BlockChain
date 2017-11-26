pragma solidity ^0.4.15;

import "./CVExtender.sol";

contract CV is CVExtender {

    /**
     * Your functions go here
     *
     * */
     
     struct Summary{
         string Photo;
         string Name;
         string CurrentRole;
         string CurrentEmployer;
         string CollegeName;
         string CurrentCity;
         string CurrentState;
         string CurrentCountry;
         string OneLineSummary;
     }
     struct Experience{
         string	CompanyLogo;
	     string EmployeerName; 
	     string Role;
	     string DuraitonFrom;
	     string DurationTo;	
	     string Address;
         string Responsibility;
     }

    
    Summary myWorkSummary;
    mapping(uint=>Experience) myWorkExperience;
    uint myExperienceCount;
    
    
     function getPhoto() public constant returns(string) {
       return myWorkSummary.Photo;
    }
    
     function getName() public constant returns(string) {
       return myWorkSummary.Name;
       }
    
     function getCurrentRole() public constant returns(string) {
       return myWorkSummary.CurrentRole;
    }
    

    function getCurrentEmployer() public constant returns(string) {
       return myWorkSummary.CurrentEmployer;
    }
    
     function getCollegeName() public constant returns(string) {
       return myWorkSummary.CollegeName;
    }
    
     function getCurrentCity() public constant returns(string) {
       return myWorkSummary.CurrentCity;
    }
    
     function getCurrentState() public constant returns(string) {
       return myWorkSummary.CurrentState;
    }
    
     function getCurrentCountry() public constant returns(string) {
       return myWorkSummary.CurrentCountry;
    }
     function getOneLineSummary() public constant returns(string) {
       return myWorkSummary.OneLineSummary;
    }
    
    function getPriorExperienceCount() public constant returns (uint){
        return myExperienceCount;
    }
    
    function getPriorExperience(uint companyID) public constant returns(string,string,string, string,string, string, string){
        return(myWorkExperience[companyID].CompanyLogo,
        myWorkExperience[companyID].EmployeerName,
        myWorkExperience[companyID].Role,
        myWorkExperience[companyID].DuraitonFrom,
        myWorkExperience[companyID].DurationTo,
        myWorkExperience[companyID].Address,
        myWorkExperience[companyID].Responsibility);
        
    }   
    
    
    
    
    function CV() public{
        
        updateBasicInfo();
        createDAEWorkExperience();
        createSiemensHealthineersWorkExperience();
        createSiemensWorkExperience();
        
    }
    
    function updateBasicInfo() private{
        myWorkSummary.Photo= "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAQNAAAAJDc0YmE5YWQwLWMzMTEtNDkyNC1iYmEzLTA4YzlkOTZjMDZhOQ.jpg";
        myWorkSummary.Name = "Sanjay Mishra";
        myWorkSummary.CurrentRole = "Technical Expert at Corporate Research, Siemens Technology Services Pvt. Ltd.";
        myWorkSummary.CurrentEmployer = "Siemens Technology India";
        myWorkSummary.CollegeName = "Kumaon Engineering College";
        myWorkSummary.CurrentCity= "Bangalore";
        myWorkSummary.CurrentState ="Karnataka";
        myWorkSummary.OneLineSummary = "12+ years of experience in software design and development.Consultant in Software architecture and design.";
        myWorkSummary.CurrentCountry = "India";       
    }
    
    function updateWorkExperience(Experience experience) private{
        myWorkExperience[myExperienceCount].CompanyLogo = experience.CompanyLogo;
        myWorkExperience[myExperienceCount].EmployeerName = experience.EmployeerName;
        myWorkExperience[myExperienceCount].Role = experience.Role;
        myWorkExperience[myExperienceCount].DuraitonFrom = experience.DuraitonFrom;
        myWorkExperience[myExperienceCount].DurationTo = experience.DurationTo;
        myWorkExperience[myExperienceCount].Address = experience.Address;
        myWorkExperience[myExperienceCount].Responsibility = experience.Responsibility;
        
    }
    
    function createSiemensWorkExperience() private{
        Experience experience;
        experience.CompanyLogo= "https://media.licdn.com/mpr/mpr/shrink_100_100/p/4/000/172/18e/247b463.png";
        experience.EmployeerName="Siemens Technology India";
        experience.Role = "Technical Expert";
        experience.DuraitonFrom = "April 2016";
        experience.DurationTo ="Til Date";
        experience.Address ="Bangalore Area";
        experience.Responsibility= "Deliver and provide support in software architecture for company’s diffrent Business Units";
        updateWorkExperience(experience);
        myExperienceCount++;
    }
    
     function createSiemensHealthineersWorkExperience() private{
        Experience experience;
        experience.CompanyLogo= "https://media.licdn.com/mpr/mpr/shrink_200_200/AAIABADGAAAAAQAAAAAAAAw6AAAAJGZjNWE5MWRjLTMxNDMtNGU5Ni1iYTA0LWM5ZjIzNDc5NmVjNQ.png";
        experience.EmployeerName="Siemens Healthineer";
        experience.Role = "Software Architect";
        experience.DuraitonFrom = "August- 2007";
        experience.DurationTo ="April- 2016";
        experience.Address ="Bangalore Area";
        experience.Responsibility= "Providing Architecture support for for  MMOncology, MICardioLogy, MINeurology and MI Reading workflows";
        updateWorkExperience(experience);
        myExperienceCount++;
    }
    
    function createDAEWorkExperience() private{
        Experience experience;
        experience.CompanyLogo= "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOXLOrlgVda5-a5KukgqTLY9gAUc206n8N7xK9ZX1S4ETtFNUr";
        experience.EmployeerName="Department of Atomic Energy";
        experience.Role = "Scientist";
        experience.DuraitonFrom = "August- 2005";
        experience.DurationTo ="August- 2007";
        experience.Address ="Mumabai";
        experience.Responsibility= "Commissioning Simulator for Kudankulam Nuclear Power plant - 1000 MW Nuclear Reactor ";
        updateWorkExperience(experience);
        myExperienceCount++;
    }


    /**
     * Below is for our CV!
     * */
    function getAddress() public constant returns(string) {
        return "http://www.example.org";
    }

    function getDescription() public constant returns(string) {
        return "This is an example";
    }
    function getTitle() public constant returns(string) {
        return "SimpleExample";
    }
    function getAuthor() public constant returns(string, string) {
        return ("Thomas", "thomas@example.org");
    }
}