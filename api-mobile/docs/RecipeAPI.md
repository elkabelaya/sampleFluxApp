# RecipeAPI

All URIs are relative to *http://www.recipepuppy.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getRecipe**](RecipeAPI.md#getrecipe) | **GET** /api/ | Get Recipe


# **getRecipe**
```swift
    open class func getRecipe(i: String, q: String? = nil, p: Int? = nil, completion: @escaping (_ data: RecipeList?, _ error: Error?) -> Void)
```

Get Recipe

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let i = "i_example" // String | Ingredient
let q = "q_example" // String | Query (optional)
let p = 987 // Int | Paging (optional)

// Get Recipe
RecipeAPI.getRecipe(i: i, q: q, p: p) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **i** | **String** | Ingredient | 
 **q** | **String** | Query | [optional] 
 **p** | **Int** | Paging | [optional] 

### Return type

[**RecipeList**](RecipeList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

