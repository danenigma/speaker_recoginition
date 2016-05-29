; Auto-generated. Do not edit!


(cl:in-package speaker-msg)


;//! \htmlinclude record.msg.html

(cl:defclass <record> (roslisp-msg-protocol:ros-message)
  ((record
    :reader record
    :initarg :record
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass record (<record>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <record>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'record)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speaker-msg:<record> is deprecated: use speaker-msg:record instead.")))

(cl:ensure-generic-function 'record-val :lambda-list '(m))
(cl:defmethod record-val ((m <record>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speaker-msg:record-val is deprecated.  Use speaker-msg:record instead.")
  (record m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <record>) ostream)
  "Serializes a message object of type '<record>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'record))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'record))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <record>) istream)
  "Deserializes a message object of type '<record>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'record) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'record)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<record>)))
  "Returns string type for a message object of type '<record>"
  "speaker/record")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'record)))
  "Returns string type for a message object of type 'record"
  "speaker/record")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<record>)))
  "Returns md5sum for a message object of type '<record>"
  "7ab1fcac04e7ea8eb98e9e4e4e856d45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'record)))
  "Returns md5sum for a message object of type 'record"
  "7ab1fcac04e7ea8eb98e9e4e4e856d45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<record>)))
  "Returns full string definition for message of type '<record>"
  (cl:format cl:nil "int32[] record~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'record)))
  "Returns full string definition for message of type 'record"
  (cl:format cl:nil "int32[] record~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <record>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'record) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <record>))
  "Converts a ROS message object to a list"
  (cl:list 'record
    (cl:cons ':record (record msg))
))
