<button type="button" class="btn btn-outline-success"
	data-bs-toggle='modal' data-bs-target='#AddTrainRideModal'>Review A Ride!
	</button>


<div class="modal fade" id="AddTrainRideModal" tabindex="-1"
	aria-labelledby="AddTrainRideModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="AddTrainRideModalLabel">Review A Ride!
					</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class='col-3 offset-2'>
					<h1>Review A Train Ride!</h1>
				</div>
				
				<form action="addToRides.do" method="GET">
					<div class='row 3'>
						<div class='col-5 offset-1'>
							<span class='input-group-text'>Title: </span> <input
								class='form-control' type="text" name="title" />
						</div>
						<div class='col-5'>
							<span class='input-group-text'>Picture URL: </span> <input
								class='form-control' type='text' name='photo' />
						</div>
						<div class='col-5 offset-1'>
							<label>Rating</label>
					<input type="radio" name="rating" value="1">&#x2B50; 
					<input type="radio" name="rating" value="2">&#x2B50; &#x2B50; 
					<input type="radio" name="rating" value="3">&#x2B50; &#x2B50; &#x2B50;
					<input type="radio" name="rating" value="4">&#x2B50; &#x2B50; &#x2B50; &#x2B50;
					<input type="radio" name="rating" value="5">&#x2B50; &#x2B50; &#x2B50; &#x2B50; &#x2B50;
							
						</div>
						<div class='col-5'>
							<span class='input-group-text'>When Was This Trip?: </span> 
							<input type='date' name='rideDate'/>
						</div>
					</div>
					<div class='col-9 offset-1'>
						<span class='input-group-text'>What did you think of this trip?: </span>
						<textarea class='form-control' rows='4' name='content'></textarea>
					
					<input type='hidden' name='trainId' value='${train.id}'/>
					<input type='hidden' name='createdById' value='${loggedInUser.id}' />
					<input type='submit' class='btn btn-success' name='Add Train'>
					</div>


			</form>
			 <script>
				radiobutton = ${train.rating};
				radiobutton.checked = true;
			</script>
			</div>
		</div>


		<%-- <jsp:include page="bootstrapFoot.jsp" /> --%>

		<!-- 	<div class="modal-footer"> -->

		<!--   <button type="button" class="btn btn-primary">Save changes</button>
							      </div> -->
	</div>
</div>