do ->
    app = angular.module 'muhlenberg', []
    app.controller 'MuhlenbergCtrl', ($scope) ->
        $scope.members = [
                login: 'test1'
                html_url: 'https://github.com/'
            ,
                login: 'test2'
                html_url: 'https://github.com/'
            ,
                login: 'test3'
                html_url: 'https://github.com/'
        ]

        $scope.repos = [
                name: 'repo1'
                html_url: 'https://github.com/'
            ,
                name: 'repo2'
                html_url: 'https://github.com/'
        ]
