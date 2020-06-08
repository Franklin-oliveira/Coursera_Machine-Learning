# Lecture 1

## What is Machine Learning?

- "The field of study that gives computers the ability to learn without being explicitly programmed." by Arthur Samuel.

- "A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P, if its performance at tasks in T, as measured by P, improves with experience E." by Tom Mitchell.

> Example: Playing checkers. <br>
>
> ![](https://www.thesprucecrafts.com/thmb/G09fmYSROImcPVVdL4TCyVDX5ps=/1500x1000/filters:fill(auto,1)/play-checkers-using-standard-rules-409287_hero_2904-e5b2d879f6ad4c0d86e3df67796b55df.jpg)
> <br>
> **E:** expecience of playing many games of checkers  <br>
> **P:** number e-mails correctly classified as spam / not spam (the probability that the program will win the next game)  <br>
> **T:** the task of playing checkers.

<br>

## Supervised Learning
 
We are given a dataset and already know what our correct output should look like. Supervised learning problems are categorized into `regression` and `classification` problems.

- **Regression problems:** usually, we are trying to predict results within a continuous output, meaning that we are trying to map input variables to some continuous function.

    > Example: Given a picture of a person, we have to predict their age on the basis of the given picture.

- **Classification problems:** we are instead trying to predict results in a discrete output. In other words, we are trying to map input variables into discrete categories.

    > Example: Given a patient with a tumor, we have to predict whether the tumor is malignant or benign.


![](https://cdn-images-1.medium.com/max/800/1*ASYpFfDh7XnreU-ygqXonw.png)

<br>

## Unsupervised Learning

It allows us to approach problems with little or no idea what our results should look like. We can derive structure from data where we don't necessarily know the effect of the variables.

We can derive this structure by clustering the data based on relationships among the variables in the data. 

- **Clustering:** Take a collection of 1,000,000 different genes, and find a way to automatically group these genes into groups that are somehow similar or related by different variables, such as lifespan, location, roles, and so on.

- **Non-clustering:** The "Cocktail Party Algorithm", allows you to find structure in a chaotic environment. (i.e. identifying individual voices and music from a mesh of sounds at a cocktail party). 


![](https://www.researchgate.net/profile/Zhenyu_Wen/publication/336642133/figure/fig3/AS:815304842170368@1571395230317/Examples-of-Supervised-Learning-Linear-Regression-and-Unsupervised-Learning.png)


<br>

## References

[[1] Machine Learning - Stanford University](https://www.coursera.org/learn/machine-learning)