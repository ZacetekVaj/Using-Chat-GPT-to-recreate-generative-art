# Using Chat-GPT to Replicate Generative Art without Programming Knowledge

## 1. Project Overview:
The project aimed to evaluate the utility of [Chat-GPT](https://chat.openai.com/) in the creation or recreation of generative art for artists lacking programming knowledge. Chat-GPT was provided with various descriptions of different images and tasked with generating code to replicate these images using the [Processing](https://processing.org/) programming language.
## 2. Methodology:
To achieve the project objectives, a structured methodology was employed.
### 2.1 Data collection:
- A set of images was curated to encompass few diffrent artistic styles.
- Descriptions corresponding to each image were manualy created to serve as input for Chat-GPT.
-  Describtions for the same images were also created using minigpt4, aistica ai, some third ai.
### 2.2 Interaction with Chat-GPT:
- Chat-GPT was engaged to generate code based on the provided image descriptions.
- The interactions involved iterative refinement to enhance the accuracy and specificity of the generated code.
### 2.3 Reviewing of the images:
- Images generated from the code were subjected to manual review, assessing their similarity to the original images as described.
### 2.4 Documentation:
- Thorough documentation was maintained for both the code and images generated based on manual descriptions.
- Additionally, documentation was created for the code and images generated using descriptions from alternative models mentioned in section 2.1.

This methodology ensured a systematic and thorough exploration of Chat-GPT's capabilities in aiding artists with no programming background in the creation of generative art.

## 3. Results:
Two artists, Casey Reas and Vera Molnar, were used for the original images used the project. In the further sections we will closely examine the original images and their recreations based off manual and generated describtions of images.
### 3.1. Results for manualy created describtions

#### 3.1.1. Casey reas:
##### 3.1.1.1: RGB 3 series: 
[RGB 3 series](https://reas.com/rgb_3/) series comprises six drawings featuring three sets of lines—red, green, and blue. These lines are created with random angles, and certain lines within each set are randomly skipped. The original image is displayed below:
![RGB3](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image.png) 
The recreated image is displayed below:
![RGB3 - recreation](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-12.png)
From both images, it is evident that they share a similar color scheme. The primary distinction lies in the intensity of colors in the recreated image. Nevertheless, Chat-GPT's generated code successfully captures most of the essential details:

- Randomly skipped lines are present in both images, preserving the characteristic style.
- Both images feature the same three main colors, albeit with slightly different intensities.
- The lines exhibit same angle behaviour.

***Conclusion:***
Given that both the original and recreated images predominantly share the same details, it is evident that Chat-GPT has successfully reproduced the image based on the initially provided description.
##### 3.1.1.2: METASOTO: 
[METASOTO](https://reas.com/metasoto/) is an interactive art piece generated on a black canvas, featuring dynamic interplay between white and black lines. The illusion of movement is achieved as the black lines seem to shift due to intersections with moving white lines. Clicking on the image introduces a novel line pattern, enhancing the interactive and evolving nature of the artwork. Part of the original artwork found on https://vimeo.com/819995343 : 
![METASOTO](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-1.png) 
Part of the recreated artwork is displayed below:
![METASOTO - recreation](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-6.png)

From both artworks, it is apparent that they share similar concepts. The primary difference lies in the quantity of lines and the manner in which black and white lines intersect. In the original, the interaction between black and white lines is randomized, determining whether the black line appears in front or behind the white line upon intersection. Conversely, in the generated artwork, black lines consistently appear in front of all intersecting white lines.

- Both artworks feature moving white lines.
- Intersecting black lines are present in both compositions.
- Both artworks are interactive, yielding the same result upon interaction.
- The manner in which black and white lines intersect differs between the two pieces.

***Conclusion:***
While Chat-GPT has successfully reproduced the image based on the initially provided description, it falls short in replicating the precise line-intersecting effect. The variable nature of the generated code suggests that achieving this effect may be possible with further refinement of the description, since the generated effect is not so far off from the original.
##### 3.1.1.3: Process 14 (software 3)
[Process 14 (software 3)](https://vimeopro.com/bitforms/reas/video/36060380) is a sophisticated artwork, and its detailed description can be found in the [Process Compendium text](https://reas.com/compendium_text/). The central concept involves incorporating elements with distinct rules outlined in the Behaviours section of the Process Compendium text. Specifically, the artwork utilizes element 4, characterized by a circular shape that moves along a straight path, is confined to the surface, and changes direction upon contact with another element. Notably, when two of these circles collide, a static circle is generated at the intersection point. The size of this static circle is determined by the distance between the centers of the elements involved in the collision, and its color is influenced by the size of the created circle. One of such generated artworks that can be seen on [Reas's website](https://reas.com/p14_s3/) is displayed below:
![Alt text](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-3.png)
Meanwhile, the image generated by ChatGPT can be viewed here:
![Alt text](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-4.png)
At first glance, the images may appear significantly different, but a closer inspection reveals that ChatGPT has successfully recreated many of the underlying concepts. In both images, circles are present, and collisions result in the generation of a new circle. However, a notable distinction exists in ChatGPT's rendition: the size and color of the generated circle are not contingent upon the distance between the centers of intersecting circles, as outlined in the original description.

- Both artworks incorporate element 4, showcasing all of its specified behaviors.
- Collisions between elements in both artworks result in the creation of a static circle.
- Notably, in ChatGPT's rendition, the circles are randomly sized, and their color does not accurately reflect the size of the circle as per the original description.

***Conclusion:***
While ChatGPT has successfully recreated several aspects of the original image, including the incorporation of element 4 and the generation of static circles upon collisions, there is a notable deviation. The random sizing and incorrect color attribution of the circles in ChatGPT's rendition indicate a divergence from the precise specifications outlined in the original description. But due to the variable nature of chatGPT's responses it might be possible to recreate the original using it, by chaning the provided describtion.
#### 3.1.2. Vera molnar:
##### 3.1.2.1: (Des)Ordres
[(Des)Ordres](https://dam.org/museum/artists_ui/artists/molnar-vera/des-ordres/) is a series of images showcasing a deliberate arrangement of concentric squares that are randomly distributed, introducing a sense of disorder and tension within the composition. [One of the original images is displayed below:](https://dam.org/museum/artists_ui/artists/molnar-vera/des-ordres/)
![DesOrdres](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-5.png)

Meanwhile, the ChatGPT-generated image is presented below:
![DesOrdresGPT](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-8.png)
In general, the images exhibit a remarkable similarity, with Vera's original image featuring variations in line thickness and a more pronounced tilt in the squares. Some squares stand out more prominently. In ChatGPT's rendition, the lines are mostly uniform with minor differences, but the whole composition is highly comparable to that of the original, capturing the essence of the pattern and its deliberate disorder.

- Both images contain concentric squares
- Both images employ a random pattern to the squares

***Conclusion:***
While ChatGPT has successfully captured the overall essence of Vera's (Des)Ordres series, the recreation includes minor differences in line thickness and tilt when compared to the original images. While these variations exist, the ChatGPT-generated image can be considered a commendable approximation of the intended pattern and disorder within the composition

##### 3.1.2.2: Interruptions
[Interruptions](https://dam.org/museum/artists_ui/artists/molnar-vera/interruptions/)  is a series in which the artist begins with a grid covered with straight lines of the same length. Random rotations are applied to each line, resulting in a densely complex pattern. To this, Vera adds interruptions, which are random sections where certain lines are intentionally erased.
[One of the original images is displayed below:](https://dam.org/museum/artists_ui/artists/molnar-vera/interruptions/)
![Alt text](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-7.png)
Meanwhile, the ChatGPT-generated image is presented below:
![Alt text](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-5-1.png)
The density of lines in ChatGPT's artwork is higher, but the core concept of the images remains very similar. The interruptions in ChatGPT's rendition are slightly more stringent, leading to the erasure of most lines within them. Despite this, the overall resemblance to the original is strikingly close.

### 3.2 Results for describtions generated by image describing models
In this section, METASOTO and Process 14 (Software 3) were excluded due to their interactive nature and progression over time. Given that many models did not yield efficient descriptions, our focus will be mostly on the starting images generated from their descriptions. We will then compare these initial images with those obtained from manual descriptions. It should also be noted that most of image describing models were optimised for stable diffusion. Images used were the same as described in previous sections, the describtions generated by the models can be viewed in documentation.
#### 3.2.1. Models used
##### 3.2.1.1. Astica
[Astica](Astica.ai) is the first https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-describing model that was tested. However, as observed in further sections, the free version of the model did not yield satisfactory results.
##### 3.2.1.2. Clip Interrogator
[Clip Interrogator](https://github.com/pharmapsychotic/clip-interrogator) is the second https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-describing model tested. Unfortunately, as it is optimized for stable diffusion, as evidenced in subsequent sections, this model proved to be less useful.
##### 3.2.1.3. MiniGPT-4
[MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4) is the third https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-describing model that was tested. In this case, utilizing both an image and a prompt has proven to be effective. While the model was not consistently useful for most images, it demonstrated usefulness for one image. This suggests that MiniGPT-4 might be a valuable tool for artists facing challenges in describing images to Chat-GPT.
#### 3.2.2. Images
##### 3.2.2.1. (Des)Ordres
The first image obtained from the describtion provided by [Astica](Astica.ai) can be seen below:
![DesOrdresAstica](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-13.png)
The first image obtained from the describtion provided by [Clip Interrogator](https://github.com/pharmapsychotic/clip-interrogator) can be seen below:
![DesOrdresClipInterrogator](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-15.png)
The first image obtained from the describtion provided by [MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4) can be seen below:![DesOrdresMiniGPT](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-16.png)
meanwhile the manualy described generated image can be seen below:
![DesOrdresManual](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-14.png)
It is evident that the image generated from automated descriptions falls short compared to the one obtained from manual description. This discrepancy persists even after refining the starting description. The manually described generated image clearly captures the pattern present in the original image, making it easier to instruct Chat-GPT to replicate that specific pattern rather than attempt to extract the original image from those generated using non-manual descriptions.
##### 3.2.2.2. Interruptions
The first image obtained from the describtion provided by [Astica](Astica.ai) can be seen below:
![InterruptionsAstica](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-17.png)
The first image obtained from the describtion provided by [Clip Interrogator](https://github.com/pharmapsychotic/clip-interrogator) can be seen below:
![InterruptionsClipInterrogator](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-18.png)
The first image obtained from the a bit more refined describtion provided by [MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4) can be seen below:
![InterruptionsMiniGPT](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-19.png)
meanwhile the manualy described generated image can be seen below:
![InterruptionsManual](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-9.png)
It is apparent that the majority of images generated from automated descriptions fall short compared to the one obtained from manual descriptions, with the exception of the result produced by [MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4). This disparity remains even after refining the starting description. Both the manually described image and the one obtained using the description generated by [MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4), have captured some of the original pattern and it was easier to replicate the original by using this generated describtion.
##### 3.2.2.3. RGB3
The first image obtained from the describtion provided by [Astica](Astica.ai) can be seen below:
![InterruptionsAstica](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-1-1.png)
The first image obtained from the describtion provided by [Clip Interrogator](https://github.com/pharmapsychotic/clip-interrogator) can be seen below:
![InterruptionsClipInterrogator](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-1-2.png)
The first image obtained from the a bit more refined describtion provided by [MiniGPT-4](https://github.com/Vision-CAIR/MiniGPT-4) can be seen below:
![InterruptionsMiniGPT](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-1-3.png)
meanwhile the manualy described generated image can be seen below:
![InterruptionsManual](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Report/Images/image-10.png)
Even though it may not be immediately evident, upon closer examination, the majority of images generated from automated descriptions fall short when compared to the one obtained from manual descriptions. After a refinement process, it became clear that the manually described image was significantly closer to the original. The manually described image effectively captured lines at different angles, facilitating a straightforward instruction to Chat-GPT to extend those lines, populate the screen with them, and randomly skip a few.
## 4. Conclusion
The exploration of generative art replication in [Processing](https://processing.org/) through the use of Chat-GPT, alongside both manually crafted descriptions and descriptions generated by various models, has provided valuable insights into the effectiveness of these approaches.

### 4.1. Usefulness of Generated Descriptions vs. Manual Descriptions
Upon comprehensive evaluation, it becomes apparent that, while descriptions generated by AI models such as Astica, Clip Interrogator, and MiniGPT-4 have shown some promise, the majority fall short in replicating the intricate details present in the original images. In contrast, manually crafted descriptions have consistently proven to be more effective. The nuanced and precise nature of manual descriptions allows for a closer alignment with the intended artistic elements, enabling easier communication with ChatGPT for accurate image replication.
### 4.2. Usefulness of Chat-GPT as a Tool for Image Replication
ChatGPT emerges as a powerful tool for generative art replication, particularly when guided by carefully constructed manual descriptions. The model's ability to understand and implement detailed prompts results in images that closely resemble the original artwork. While descriptions generated by AI models demonstrated potential, ChatGPT's responsiveness to manually crafted instructions proved more reliable and yielded superior results.
### 4.3. Overall Reflection
The project underscores the importance of well-crafted prompts and instructions in leveraging ChatGPT for generative art. While AI-generated descriptions offer a degree of automation, their efficacy is limited compared to the precision achievable through manual input. ChatGPT, as a creative tool, showcases its potential when provided with explicit and intricate guidance, emphasizing the collaborative role of human input in achieving optimal results.

In conclusion, the combination of ChatGPT and manually crafted descriptions proves to be a synergistic approach for generative art replication, offering a balance between automation and precision that enhances the creative process.


