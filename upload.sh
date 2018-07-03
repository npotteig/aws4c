file=${1}
bucket=${2}
resource="/${bucket}/${file}"
contentType="application/xml"
dateValue=`date -R`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=AKIAJ6QDK3AJ55X6L2NA
s3Secret=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
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
curl -X PUT -T "${file}" \
  -H "Host: ${bucket}.s3.amazonaws.com" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Authorization: AWS ${s3Key}:${signature}" \
  https://${bucket}.s3.amazonaws.com/${file}

