var client = algoliasearch(ENV['ALGOLIA_ID'], ENV['ALGOLIA_SEARCH']);
var index = client.initIndex('User');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
