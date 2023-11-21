# SpecDoc
<br>

<p align="center"> Your Ultimate Healthcare Companion! Instantly connect with top-notch doctors in every specialty, making healthcare personalized and hassle-free.</p>

<p align="center">

  <img src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/bae41831-6e82-435f-97ec-3dffb403d8d3" width=500px/><br>
  
</p>



<!--TABLE OF CONTENTS-->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a> 
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a> 
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
  </details>

  There are many great README templates available on GitHub;however, I didn't find one that really suited my needs so I created this one. I wanted to create a README template which satisfies the project.
  
Here's why:

- A project that solves a problem and helps others.
- One shouldn't be doing the same task over and over like creating a README from scratch.
- You should implement DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So i'll be  adding more in the near future.You may also suggest changes by forking this repo and creating a pull request or opening issue. Thanks to all the people have contributed to expanding this template!

<!--About the Project-->
  
## About The Project

LegalEdge is a flutter application which uses firebase to sign in users and create a new account. With the help of our Node.js backend we have integrated the functionalities of registering users, lawyers , creating posts , liking a post and also commenting on the posts. 
  

### Built With

This section should list any major frameworks/libraries used to bootstrap your project.Leave any add-ons/plugins for the acknowledgement section. Here are a few examples.

![image](https://user-images.githubusercontent.com/106571927/206698131-0921a8dc-5ea9-46f7-a68c-ad1c717a0ff1.png)

![image](https://user-images.githubusercontent.com/106571927/206698233-ac9c9c2b-0d7d-49b9-8995-1c0761329324.png)

<img height="100px" src="https://upload.wikimedia.org/wikipedia/commons/0/05/Go_Logo_Blue.svg"/>





<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--GETTING STARTED-->

## Getting Started

We recommend creating a new flutter project using 'flutter create --org project_name' ,
which sets up a default application setup automatically. To create a project, run the followingf command in cmd after downloading and sucessfully installing flutter:

'flutter create --org project_name'

### Prerequisites

After the installation is complete:

In the main file try running with the run without debugging:

![Screenshot (13)](https://user-images.githubusercontent.com/106571927/206700482-3ca687cf-49ef-40e8-b8e4-3f56503153c8.png)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Installation 

Below is an example of how you can instruct your audience on installing and setting up your app.This template doesn't rely on any external dependencies or services.

1.Clone the repo 

git clone https://github.com/Uttkarsh-raj/SpecDoc


2.Install the packages 

flutter pub get


<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Setup backend
Setup the repo in your local system
```
https://github.com/Uttkarsh-raj/SpecDoc
```
Run the following commands next in the /Backend directory
```
go run main.go
```
The server has started and ready to send and receive requests.
Next, head to the Frontend/Plannerly/lib/services/apis.dart and add these changes
```
var baseUrl = "http://your_id_address_here:8000";
```
Now you are ready to run the project locally.

## Routes

#### GET '/categories'
* Responds as {success:true, data:categoriesObject}

#### POST '/search'
* Send {search} as Request body
* Responds as {success:true, data:categoriesObject}

<!--USAGE EXAMPLES-->

## Usage
1. **Search Categories:**
   - **Problem:** Users face challenges in fltering the doctors or searching for a specific category of doctors.
   - **Solution:** With SpecDoc, users can easily search and explore the doctors in a category.

2. **Booking an appointment:**
   - **Problem:** Users struggle to book an appointment online.
   - **Solution:** SpecDoc allows users to get an appointment booked.
   - 
### Screenshots:

## Login and Signup Screens:

<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/c1f91204-d28b-4cc3-bb91-8193dc8c5c1c"></img>
<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/46e99417-c7bb-4ce3-9a2c-e29f53948b87"></img>

## Other ScreenShots: 
<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/1a1a15cb-0c2c-49e0-a76c-5c358c50a2e9"></img>
<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/11772bf8-820e-4ce8-a41b-60a9c6958cc6"></img>
<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/88105ca0-5744-4cdf-abc4-09a1f953e5dd"></img>
<img width="320" src="https://github.com/Uttkarsh-raj/SpecDoc/assets/106571927/9afb2f94-ea0c-4718-96d3-2f93e6de7083"></img>




<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Add Changelog
- [x] Add back to top links
- [x] Add Additional Templates w/ Examples
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support
  - [ ] Hindi
  - [ ] English

  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--CONTRIBUTING-->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire ,and create.Any contributions you make are *greatly appreciated*.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact
Uttkarsh Raj - https://github.com/Uttkarsh-raj <br>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
- [Malven's Grid Cheatsheet](https://grid.malven.co/)
- [Img Shields](https://shields.io)
- [GitHub Pages](https://pages.github.com)
- [Font Awesome](https://fontawesome.com)
- [React Icons](https://react-icons.github.io/react-icons/search) 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
