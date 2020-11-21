
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export const dogLinkCreator = function(dogs){
  const dogsArr = [];
  
  for (const dog in dogs) {
    const liTag = document.createElement('li');
    const aTag = document.createElement('a');
    aTag.innerHTML = dog;
    aTag.setAttribute("href", dogs[dog])
    liTag.appendChild(aTag) 
    liTag.setAttribute("class", "dog-link")
    dogsArr.push(liTag)
  }
  return dogsArr;
}


export const attachDogLinks = function(dogs){
  const dogLinks = dogLinkCreator(dogs);
  const dogDropdown = document.querySelector(".drop-down-dog-list");
  dogLinks.forEach(link => dogDropdown.appendChild(link));
}

attachDogLinks(dogs)

