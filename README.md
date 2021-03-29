![MVPComplete](https://user-images.githubusercontent.com/4231144/112772983-d0036480-8fe8-11eb-9521-c7c5f1f99153.gif)


# MuxLiveStreameriOS
A live streaming app for the Stonks iOS interview

**Specification Summary:** 
- Native Application (Choosing Xcode and Swift)
- Stream from [mux.com](https://docs.mux.com/guides/video/start-live-streaming), no broadcasting necessary. 
- Screen 1 (Home) 
  - keep live stream view fixed at top. 
  - Scrollable content below it. 
  - NavBar at the bottom should enable navigation between the two screens.  Or Tabbar? 
- Screen 2 
  - Scrollable content 
- Navigating
  - From Home -> 2 Live stream from player 1 should switch to mini mode, continuing to play the stream, bottom right.  
  - From 2 -> Home Live stream should return to fixed top view and continue streaming.
  - Smooth transition. 

**Additional notes**
- Should take 3 hours to a few days.
- Please make reasonable assumptions and design choices where you feel the specification is unclear or falls short. Reach out to us for any further clarifications. 
- *Testing the Stream* Larix Broadcaster can be used to test the stream. Create a new connection using the URL `rtmps://global-live.mux.com:443/app/<YOUR-STREAM-KEY>` and you will be good to go. Other broadcasting tools like OBS can also be used to get the job done.

**Deliverables**
- Screen recording of the application demonstrating navigation between the screens.
- Link to the public git repo containing your code along with a README file.

**Criteria**
1. Efficiency, performance, and readability of your code
2. Ability to navigate third-party libraries where the documentation might not be
very detailed.
3. Proper documentation (code comments and readme)

# UI Plan #
The assignment includes a screen shot for each of the two required screens. 

The bottom has what appears as a tab view.  So this should have 3 or so viewControllers.  
1.  TabViewController. 
2.  HomeViewController.
3.  DetailsViewController.

## TabViewController ##
Since a smooth transition of the live stream View is desired I think might make sense to let the stream video view be a subView to the container view which is the TabViewController. 

So the TabViewController will have its default TabView at the bottom along with a stream video subView which would could initially be added as a subView to a fixed View in the HomeViewController.

At first I thought I would have to move the streamer view back and forth between the container and the contained views as the transition occurs.  However now I am thinking I only need to set the original constraints equal to a fixed view in the HomeViewController and animate them to the bottom right in the container without adding it as a subview to the contained views. 

**Transition Home->2** 
- *DidStartTransitioning*
  - animate the stream view to the bottom right of the view. and reduce its frame. 

**Transition 2->Home**
- *DidStartTransitioning*
  - animate the stream view from the bottom right of the view to the HomeViewController's fixed view's position and increase its frame to match it. 
    
    -  **Choices:** 
     - This can be done with constraints, or resizing the frame. Constraints are better practice. 
     - CoreAnimation directly, or UIView.animateWithDuration wrapper.  Try with UIView.animateWithDuration first, if that isn't catered properly, use CoreAnimation directly.  
     - Or reusing the wheel with a framework already made. Downside: might not move to the correct location.

Letting the Streaming player keep its same view allows us to avoid the problem of having to manage streaming state and position in the video which would open the door to more opportunities for errors and bugs.  

**viewControllers {set}**
- Append HomeViewController with title: "HOME"
- Append DetailsViewController with title: "SCREEN2"

## HomeViewController Plan ##
  ```[ Label      ]
  [ view       ]
  [ TableView  ] 
    <Cell>[Label  ]
          [Content]
   ```
  
## DetailsViewController Plan ## 
 ``` [ Label     ]
  [ TableView ]
  <Cell>[ Label ]
  ```
  

# Backend #
- Need to fetch the streaming content.  This will involve researching the following resources. 
  - [Mux](https://docs.mux.com/guides/video/start-live-streaming)
  - [AVPlayerLayer](https://developer.apple.com/documentation/avfoundation/avplayerlayer)

- Since the text is disconnected and random, I have a temptation to reflect that in the models, which would demonstrate adherance to the specifications but wouldn't demonstrate an understanding of modeling and structures.  I think I am going to opt for adherance to the specifications in favor of demonstrating something for the sake of demonstrating something. 
 

# Process #
1. Create the inanimate UI for the two View Controllers and a tab view. 
2. Implement the animation for the stream view from HomeViewController to DetailViewController. 
3. Implement the streaming. 
4. Add an AVPlayer as a subView to the moving view. 


**Issue**
- There are many options for creating custom views.  nibs or programmatically written views can be reused, unlike views directly implemented in storyboard. Unique storyboards can be used for each reusable viewController.  
- The only reused view appears to be the one for the tableViewCell.  

- The TabBar has a rule that "You should never access the tab bar view of a tab bar controller directly." This means in order to have the view transition I can:
  - Overlap the TabBar Controller with a Transparent, touch through view Controller that has an opaque streamer view. 
  - Create a custom Tab Bar Controller that allows me to put the view overlapping. 
  - Or instead of using a Tab Bar, a navigation controller could be used. 
  - Or the view cna be passed as a payload to the other tab View.  We can simulate the movement, by capturing the frame and animating it up and down. 

**To Do:**
- [x] [tests @77% coverage](https://github.com/ElevatedUnderdogs/MuxLiveStreameriOS/pull/11)
- [x] [Add loading spinner](https://github.com/ElevatedUnderdogs/MuxLiveStreameriOS/pull/10)
- [x] [fix crash when clicking the stream](https://github.com/ElevatedUnderdogs/MuxLiveStreameriOS/pull/9)
- [x] [Create Launch Screen](https://github.com/ElevatedUnderdogs/MuxLiveStreameriOS/pull/13)
- [x] [Create app icon](https://github.com/ElevatedUnderdogs/MuxLiveStreameriOS/pull/14)
- [ ] No internet handling
- [ ] loop the stream
- [ ] verification with multiple different videos that have visually distinct parts to confirm the whole video is being played properly, and that the current video location is the same when transitioning controller views. 
- [ ] Experiment with custom TabController so that view can animate to the bottom. 
- [ ] Experiment with project just to use PictureInPictureController and make that work. 
- [ ] Recode with SwiftUI and Combine.
- [ ] Extract the parts reused from other projects into Swift Packages. URL, Color components. 
- [ ] Experiment with passing `PlayerView` across `ViewControllers`, `Player`, `PlayerLayer` Along with a Publisher subscriber architecture in case the video changes dynamically. 
