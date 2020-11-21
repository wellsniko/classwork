
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.hasChildNodes()){
        Array.from(htmlElement.children).forEach((child) => child.remove());
    }
    const pTag = document.createElement("p");
    pTag.innerText = string;
    htmlElement.appendChild(pTag);
};

htmlGenerator('Welcome To the Pocket Project Marathon!', partyHeader);

