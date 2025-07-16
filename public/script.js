document.getElementById("fetchBtn").addEventListener("click", async () => {
  const res = await fetch("/fetch", {
    method: "POST",
  });
  const data = await res.text();
  document.getElementById("result").innerHTML = data;
});
