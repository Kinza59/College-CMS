<!DOCTYPE html>
<html>
<head>
	<title>Attendance</title>
    
</head>
<body>

    <?php

    	$subjID = array();
        $subjectsIDs = 0;

    	$empEmail = Yii::$app->user->identity->email;
    	$empId = Yii::$app->db->createCommand("SELECT emp.emp_id FROM emp_info as emp WHERE emp.emp_email = '$empEmail'")->queryAll();
    	$empId = $empId[0]['emp_id'];
        $teacherId = Yii::$app->db->createCommand("SELECT teacher_subject_assign_head_id FROM teacher_subject_assign_head WHERE teacher_id = '$empId'")->queryAll();
        $headId = $teacherId[0]['teacher_subject_assign_head_id'];

		$classId = Yii::$app->db->createCommand("SELECT DISTINCT d.class_id FROM teacher_subject_assign_detail as d INNER JOIN teacher_subject_assign_head as h ON d.teacher_subject_assign_detail_head_id = h.teacher_subject_assign_head_id WHERE h.teacher_id = '$empId'")->queryAll();
		$countClassIds = count($classId);

    	for ($i=0; $i <$countClassIds ; $i++) {
    	 $id = $classId[$i]['class_id'];
    	 $CLASSName = Yii::$app->db->createCommand("SELECT seh.std_enroll_head_name,seh.std_enroll_head_id
    		FROM std_enrollment_head as seh
    		INNER JOIN teacher_subject_assign_detail as tsad
    		ON seh.std_enroll_head_id = tsad.class_id WHERE seh.std_enroll_head_id = '$id'")->queryAll();
        $subjectsIDs = Yii::$app->db->createCommand("SELECT tsad.subject_id
        FROM teacher_subject_assign_detail as tsad
        WHERE tsad.class_id = '$id' AND tsad.teacher_subject_assign_detail_head_id = '$headId'")->queryAll();
        
        	?>
   
    	   <div class="col-md-6">
                <div class="box box-success collapsed-box" >
                    <div class="box-header with-border" style="background-color: #dff0d8;padding: 15px;">
                        <h3 class="box-title">
                          	<b>
            				<?php echo $CLASSName[0]['std_enroll_head_name']; ?>
            				</b>
                        </h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">  <br><i class="fa fa-plus" style="font-size:15px;"></i>
                            </button>
                        </div>
                        <!-- /.box-tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                    	<?php 
                    		foreach ($subjectsIDs as $key => $value) {

                    			$SubID = $value['subject_id'];
                    			//$count = count($SubID);
                    			$subjectsNames = Yii::$app->db->createCommand("SELECT subject_id,subject_name
        						FROM subjects WHERE subject_id = '$SubID'")->queryAll();
                    	?>
                        <div class="row container">
                            <tr>
                                <td>
                                    <a href="./activity-view?sub_id=<?php echo $SubID ?>&class_id=<?php echo $id; ?>&emp_id=<?php echo $empId; ?>" " style="">
                                       <i class="fa fa-book" style="background-color:  #dff0d8; border:1px solid #00a65a; padding:20px ;border-radius:20px;font-size:15px; color:#00a65a;"> <?php echo $subjectsNames[0]['subject_name']; ?></i> 
                                    </a>  
                                </td>
                            </tr>
                        </div>
                        <br>
                    <?php   
                        //end of foreach
                        } ?>
                    	
                    </div>
                    <!-- /.box-body -->
                </div>
              <!-- /.box -->
            </div>
  <?php 
        //end of for loop
        } ?>
   
    

</body>
</html>
