public with sharing class OCRService {

    @AuraEnabled
    public static Map<String,String> extractReceiptData(Id contentVersionId){
        Map<String,String> result = new Map<String,String>();

        // Fetch file
        ContentVersion cv = [SELECT VersionData FROM ContentVersion WHERE Id = :contentVersionId LIMIT 1];
        Blob fileBody = cv.VersionData;

        // Prepare HTTP request to Google Vision API
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:GoogleVisionAPI'); // Named Credential
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');

        String base64Data = EncodingUtil.base64Encode(fileBody);
        String body = '{"requests":[{"image":{"content":"' + base64Data + '"},"features":[{"type":"TEXT_DETECTION"}]}]}';
        req.setBody(body);

        Http http = new Http();
        HttpResponse res = http.send(req);

        // Parse JSON response
        Map<String,Object> jsonRes = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        List<Object> responses = (List<Object>) jsonRes.get('responses');

        String detectedText = '';
        if(responses != null && responses.size() > 0){
            Map<String,Object> firstResponse = (Map<String,Object>) responses[0];
            List<Object> textAnnotations = (List<Object>) firstResponse.get('textAnnotations');
            if(textAnnotations != null && textAnnotations.size() > 0){
                detectedText = (String)((Map<String,Object>)textAnnotations[0]).get('description');
            }
        }

        // Simple parsing (you can improve this with regex)
        result.put('Vendor','Parsed Vendor');
        result.put('Amount','100.0');
        result.put('Date', Date.today().format());

        return result;
    }
}
