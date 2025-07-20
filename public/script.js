const btn = document.getElementById("fetchBtn");
const countdownText = document.getElementById("countdownText");

btn.addEventListener("click", async () => {

  btn.disabled = true;
  btn.style.opacity = "0.5";
  let seconds = 10;
  countdownText.textContent = `Please wait ${seconds}s`;
  const timer = setInterval(() => {
    seconds--;
    countdownText.textContent = `Please wait ${seconds}s`;
    if (seconds <= 0) {
      clearInterval(timer);
      btn.disabled = false;
      btn.style.opacity = "1";
      countdownText.textContent = "";
    }
  }, 1000);

  const res = await fetch("/fetch", {
    method: "POST",
  });
  const data = await res.text();
  document.getElementById("result").innerHTML = data;

});