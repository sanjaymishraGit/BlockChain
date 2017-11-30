// Import the page's CSS. Webpack will know what to do with it.
import "../stylesheets/app.css";
import "bootstrap/dist/css/bootstrap.css"

// Import libraries we need.
import { default as Web3} from 'web3';
import { default as contract } from 'truffle-contract'

// Import our contract artifacts and turn them into usable abstractions.
import myCV_artifacts from '../../build/contracts/CV.json'

// CV is our usable abstraction, which we'll use through the code below.
var myCV = contract(myCV_artifacts);

// The following code is simple to show off interacting with your contracts.
// As your needs grow you will likely need to change its form and structure.
// For application bootstrapping, check out window.addEventListener below.
var accounts;
var account;

window.App = {
  start: function() {
    var self = this;

    // Bootstrap the MyCV abstraction for Use.
    myCV.setProvider(web3.currentProvider);

    // Get the initial account balance so it can be displayed.
    web3.eth.getAccounts(function(err, accs) {
      if (err != null) {
        alert("There was an error fetching your accounts.");
        return;
      }

      if (accs.length == 0) {
        alert("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
        return;
      }
      accounts = accs;
      account = accounts[0];

      App.basicInfoUpdate();
      App.UpdateExperienceSummary();   
   //   App.multiplyNode(document.getElementById("experience"), priorExperienceCount, true);
      

//App.listenToEvents();     
    });
  },  
  
  basicInfoUpdate:function(){
    var cvInstance; 
    myCV.deployed().then(function(instance) { 
      cvInstance= instance;
     // document.getElementById("cvAddress").innerHTML= cvInstance.address;
      return instance.getPhoto();
    }).then(function(photo) {
      document.getElementById("photo").src= photo;
      return cvInstance.getName();
    }).then(function(name) {
        document.getElementById("name").innerHTML = name;
        return cvInstance.getOneLineSummary();
    }).then(function(oneLineSummary){
      document.getElementById("oneLineSummary").innerHTML = oneLineSummary;
      return cvInstance.getCurrentEmployer();
    }).then(function(currentEmployer){
      document.getElementById("currentEmployer").innerHTML = currentEmployer;
      return cvInstance.getCollegeName();
    }).then(function(collegeName){
      document.getElementById("collegeName").innerHTML = collegeName;
      return cvInstance.getCurrentCity();
    }).then(function(currentCity){
      document.getElementById("currentCity").innerHTML = currentCity;
      return cvInstance.getCurrentState();
    }).then(function(currentState){
      document.getElementById("currentState").innerHTML = currentState;
      return cvInstance.getCurrentCountry();
    }).then(function(currentCountry){
      document.getElementById("country").innerHTML = currentCountry;
    });
  },

  multiplyNode: function(node, count, deep) {
    for (var i = 0, copy; i < count - 1; i++) {
        copy = node.cloneNode(deep);
        node.parentNode.insertBefore(copy, node);
    }
},

UpdateExperienceSummary: function(){
  var cvInstance;
  myCV.deployed().then(function(instance){
    cvInstance = instance;
    return cvInstance.getPriorExperienceCount();
  }).then(function(priorExperienceCount){
    
    //TODO: need to loop here.
    var experiences= [];
    for (var i=0;i<priorExperienceCount;i++)
    {
      var result = cvInstance.getPriorExperience(i);
      //console.log(result);
      experiences.push(result);
      
    }
   return experiences;

  }).then(function(experiences){
    console.log(experiences);
    
    App.fillExperience(experiences);
  })
 },

 fillExperience(experiences){
   //TODO: need to look here
  experiences.forEach(element => {
    //console.log(element);
    //App.fillSummaryDetails(element);
  });
 },

 fillSummaryDetails:function(priorExperience){
   console.log(priorExperience);
   document.getElementById("companylogo").src= priorExperience[0];
   document.getElementById("companyName").innerHTML= priorExperience[1];
   document.getElementById("role").innerHTML= priorExperience[2];
   document.getElementById("from").innerHTML= priorExperience[3];
   document.getElementById("to").innerHTML= priorExperience[4];
   document.getElementById("address").innerHTML= priorExperience[5];
   document.getElementById("responsibilities").innerHTML= priorExperience[6];  


 },
  

};

window.addEventListener('load', function() {
  // Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 !== 'undefined') {
    console.warn("Using web3 detected from external source. If you find that your accounts don't appear or you have 0 MetaCoin, ensure you've configured that source properly. If using MetaMask, see the following link. Feel free to delete this warning. :) http://truffleframework.com/tutorials/truffle-and-metamask")
    // Use Mist/MetaMask's provider
    window.web3 = new Web3(web3.currentProvider);
  } else {
    console.warn("No web3 detected. Falling back to http://127.0.0.1:8545. You should remove this fallback when you deploy live, as it's inherently insecure. Consider switching to Metamask for development. More info here: http://truffleframework.com/tutorials/truffle-and-metamask");
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    window.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
  } 

  App.start();
});
