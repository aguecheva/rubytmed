let toggle = document.getElementById("toggle");
let label_toggle = document.getElementById("label_toggle");

toggle.addEventListener("change", (event) => {
  let checked = event.target.checked;
  document.body.classList.toggle('dark');
  let links = document.querySelectorAll(".init a");

  links.forEach((link) => {
    if (checked) {
      link.classList.add("dark");
      label_toggle.innerHTML = '<i class="far fa-sun"></i>';
    } else {
      link.classList.remove("dark");
      label_toggle.innerHTML = '<i class="far fa-moon"></i>';
    }
  });
});
