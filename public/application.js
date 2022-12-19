
// select labels

// let labels = [];
// document.querySelectorAll(".label").forEach((label) => {
//   label.addEventListener("click", (e) => {
//     e.currentTarget.classList.toggle("active");
//     // labels.push(e.currentTarget.innerText);
//     // console.log(labels);
//   })
// })


// mark task as done
document.querySelectorAll(".checkbox").forEach((checkbox) => {
  checkbox.addEventListener("change", (e) => {
    const selectedTask = e.currentTarget.parentElement.parentElement.parentElement;
    selectedTask.children[0].children[0].classList.toggle("done");
  })
})

// Hide / show form
document.querySelector(".round-btn").addEventListener("click", () => {
  document.querySelector(".overlay").classList.remove("hidden");
})

document.querySelector("#close-overlay").addEventListener("click", () => {
  document.querySelector(".overlay").classList.add("hidden");
})
