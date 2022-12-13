
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

button {
	border: none;
	outline: none;
	cursor: pointer;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #e5e5e5;
	display: flex;
	justify-content: center;
	height: 100vh;
	width: 100%;
}

section {
	max-width: 1100px;
	margin: auto;
	text-align: center;
	padding: 0 1rem;
}

h1 {
	font-size: 3rem;
	margin-bottom: 2rem;
}

p {
	font-size: 2rem;
}

.chat-btn {
	position: fixed;
	right: 50px;
	bottom: 50px;
	background: dodgerblue;
	color: white;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	opacity: 0.8;
	transition: opacity 0.3s;
	box-shadow: 0 5px 5px rgba(0, 0, 0, 0.4);
}

.chat-btn:hover, .submit:hover, #emoji-btn:hover {
	opacity: 1;
}

.chat-popup {
	display: none;
	position: fixed;
	bottom: 80px;
	right: 120px;
	height: 400px;
	width: 300px;
	background-color: white;
	/* display: flex; */
	flex-direction: column;
	justify-content: space-between;
	padding: 0.75rem;
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
	border-radius: 10px;
}

.show {
	display: flex;
}

.chat-area {
	height: 80%;
	overflow-y: auto;
	overflow-x: hidden;
}

.income-msg {
	display: flex;
	align-items: center;
}

.avatar {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
}

.income-msg .msg {
	background-color: dodgerblue;
	color: white;
	padding: 0.5rem;
	border-radius: 25px;
	margin-left: 1rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.4);
}

.badge {
	position: absolute;
	width: 30px;
	height: 30px;
	background-color: red;
	color: white;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	top: -10px;
	right: -10px;
}

.input-area {
	position: relative;
	display: flex;
	justify-content: center;
}

input[type="text"] {
	width: 100%;
	border: 1px solid #ccc;
	font-size: 1rem;
	border-radius: 5px;
	height: 2.2rem;
}

#emoji-btn {
	position: absolute;
	font-size: 1.2rem;
	background: transparent;
	right: 50px;
	top: 2px;
	opacity: 0.5;
}

.submit {
	padding: 0.25rem 0.5rem;
	margin-left: 0.5rem;
	background-color: green;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	opacity: 0.7;
}

.out-msg {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.my-msg {
	display: flex;
	justify-content: flex-end;
	margin: 0.75rem;
	padding: 0.5rem;
	background-color: #ddd;
	border-radius: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.4);
	word-break: break-all;
}

@media ( max-width :500px) {
	.chat-popup {
		bottom: 120px;
		right: 10%;
		width: 80vw;
	}
}
</style>
<body>
	<section>
		<div class="chat-popup">
			<div class="badge">1</div>
			<div class="chat-area">
				<div class="income-msg">
					<img src="img/person.jpg" class="avatar" alt=""> <span
						class="msg"> Hi, How can I help you?</span>
				</div>
				<div class="out-msg">
				    <span class="my-msg">fsd</span>
				    <img src="img/me.jpg" class="avatar">
			    </div>
			</div>

			<div class="input-area">
				<input type="text">
				<button class="submit">
					<i class="material-icons"> send</i>
				</button>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
const popup = document.querySelector('.chat-popup');
const chatBtn = document.querySelector('.chat-btn');
const submitBtn = document.querySelector('.submit');
const chatArea = document.querySelector('.chat-area');
const inputElm = document.querySelector('input');


        

//   chat button toggler 

chatBtn.addEventListener('click', ()=>{
    popup.classList.toggle('show');
})

// send msg 
submitBtn.addEventListener('click', ()=>{
    let userInput = inputElm.value;

    let temp = "<div class=\"out-msg\">\r\n"
		+ "    <span class=\"my-msg\">"+userInput+"</span>\r\n"
		+ "    <img src=\"img/me.jpg\" class=\"avatar\">\r\n"
		+ "    </div>";

    chatArea.insertAdjacentHTML("beforeend", temp);
    inputElm.value = '';

})
</script>
</html>