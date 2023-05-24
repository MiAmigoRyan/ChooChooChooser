<button type="button" class="btn btn-outline-success"
	data-bs-toggle='modal' data-bs-target='#TransferWishToRideModal'>Move
	from Wishlist & Review A Ride!</button>


<div class="modal fade" id="TransferWishToRideModal" tabindex="-1"
	aria-labelledby="TransferWishToRideModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="TransferWishToRideModalLabel">Tell
					Us about your Ride!</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="transferToRides.do" method="GET">
					<div class='row 3'>
						<div class='col-12'>
							<span class='input-group-text'>Title: </span> <input
								class='form-control' type="text" name="title" />
						</div>
						<div class='col-12'>
							<span class='input-group-text'>Picture URL: </span> <input
								class='form-control' type='text' name='photo' />
						</div>
						<div class='col-12'>
							<span class='input-group-text'>How would you rate this
								trip?: </span>
						</div>
						<div class='col-12'> 
							<input type="radio" name="rating" value="1">&#x2B50; <br>
							<input type="radio" name="rating" value="2">&#x2B50; &#x2B50;<br> 
							<input type="radio" name="rating" value="3">&#x2B50; &#x2B50; &#x2B50;<br>
						</div>	

						<div class='col-12'>
							<span class='input-group-text'>When Was This Trip?: </span>
							<input type='date' name='rideDate' />
						</div>
						<div class='col-12'>
							<span class='input-group-text'>What did you think of this
								trip?: </span>
							<textarea class='form-control' rows='4' name='content'></textarea>

							<input type='hidden' name='trainId' value='${train.id}' /> <input
								type='hidden' name='createdById' value='${loggedInUser.id}' />
							<input type='submit' class='btn btn-success' name='Add Train'>
						</div>
					</div>


				</form>
			</div>
		</div>


		<%-- <jsp:include page="bootstrapFoot.jsp" /> --%>

		<!-- 	<div class="modal-footer"> -->

		<!--   <button type="button" class="btn btn-primary">Save changes</button>
							      </div> -->
	</div>
</div>