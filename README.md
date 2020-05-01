# Upload-Image

			 Post an image to the server


Multiple way of doing this

1. The Base64 way.

2. The Byte array way.

3. Multipart/form-data way.

Multipart/form-data is a content-type similar to application/json
The post body contains multiple parts and each part is divided by a boundary

Example: 

struct ImageRequest : Encodable
{
    let attachment : String
    let fileName : String
}
Way to create body by above two parameter: 


Main boundary

Content-Boundary

Content Disposition form-data;
name = "attachment"

Attachment value

Content-Boundary

Content Disposition form-data;
name = "fileName"

fileName value

End of main boundary--
