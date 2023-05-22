<button type="button" class="btn btn-outline-success"
	data-bs-toggle='modal' data-bs-target='#AddTrainModal'>Add A
	Train</button>


<div class="modal fade" id="AddTrainModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="AddTrainModalLabel">Add A
					Train</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class='col-3 offset-2'>
					<h1>Add a new Train</h1>
				</div>
				
				<form action="addTrain.do" method="GET">
					<div class='row 3'>
						<div class='col-5 offset-1'>
							<span class='input-group-text'>Name: </span> <input
								class='form-control' type="text" name="name" />
						</div>
						<div class='col-5'>
							<span class='input-group-text'>Picture URL: </span> <input
								class='form-control' type='text' name='photo' />
						</div>
						<div class='col-5 offset-1'>
							<span class='input-group-text'>Does this train run year
								round?: </span> <select class='form-control' name='yearRound'>
								<option id='yearRound' value='0'>No</option>
								<option id='yearRound' value='1'>Yes</option>
							</select>
						</div>
						<div class='col-5'>
							<span class='input-group-text'>Amenities: </span> <input
								type='checkbox' name='amenitiesSelection' value='1'> <input
								type='checkbox' name='amenitiesSelection' value='2'> <input
								type='checkbox' name='amenitiesSelection' value='3'> <input
								type='checkbox' name='amenitiesSelection' value='4'> <input
								type='checkbox' name='amenitiesSelection' value='5'> <input
								type='checkbox' name='amenitiesSelection' value='6'>
						</div>
						<div class='col-5 offset-1'>
							<span class='input-group-text'>Engine Type: </span> <select
								class='form-control' name='engineSelection' required>
								<option id='engineSelection' value='1'>Steam Locomotive</option>
								<option id='engineSelection' value='2'>Diesel
									Locomotive</option>
							</select>
						</div>
					</div>
					<div class='col-5'>
						<span class='input-group-text'>Rail Gauge: </span> <select
							class='form-select' name="railSelection" required>
							<option id='railSelection' value="1">Narrow Gauge</option>
							<option id='railSelection' value="2">Standard Gauge</option>
							<option id='railSelection' value="3">Cog Railway</option>
						</select>
					</div>
					<div class='col-5 offset-1'>
						<span class='input-group-text'>Website: </span> <input
							class='form-control' name='website' type='text' />
					</div>
					<div class='col-9 offset-1'>
						<span class='input-group-text'>Description : </span>
						<textarea class='form-control' rows='4' name='description'></textarea>
					<input type='hidden' name='createdById' value='${loggedInUser.id}' />
					<input type='submit' class='btn btn-success' name='Add Train'>
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