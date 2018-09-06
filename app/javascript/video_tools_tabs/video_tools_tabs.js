const videoToolsTabs = () => {
  const tabOneButton = document.querySelector("#tab-1");
  const tabTwoButton = document.querySelector("#tab-2");

  const tabOneBody = document.querySelector("#tab-body-1");
  const tabTwoBody = document.querySelector("#tab-body-2");

  if (tabOneButton, tabTwoButton, tabOneBody, tabTwoBody) {

    const DisplayBodyHideOthersOne = (event) => {
      tabOneButton.classList.add("active");
      tabOneBody.classList.add("show");
      tabOneBody.classList.remove("hidden");
      tabTwoButton.classList.remove("active");
      tabTwoBody.classList.remove("show");
      tabTwoBody.classList.add("hidden");
    }

    const DisplayBodyHideOthersTwo = (event) => {
      tabTwoButton.classList.add("active");
      tabTwoBody.classList.add("show");
      tabTwoBody.classList.remove("hidden");
      tabOneButton.classList.remove("active");
      tabOneBody.classList.remove("show");
      tabOneBody.classList.add("hidden");
    }

    tabOneBody.classList.remove("hidden");
    tabOneBody.classList.add("show");
    tabOneButton.addEventListener("click", DisplayBodyHideOthersOne);
    tabTwoButton.addEventListener("click", DisplayBodyHideOthersTwo);
  }


};







export { videoToolsTabs };
