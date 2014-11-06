---
---

app = angular.module 'muhlenberg', []
app.controller 'MuhlenbergController', ['$scope', '$http', ($scope, $http) ->
    # Initialize empty members and repos
    $scope.members = []
    $scope.repos = []

    # Loads the members for the organization
    $scope.loadMembers = ->
        members_url = 'https://api.github.com/orgs/Muhlenberg/members'
        $http.get(members_url).success (members) ->
            # Now we'll get the full User object that has the `name` attribute
            for member in members
                $http.get(member.url).success (member) ->
                    $scope.members.push member

    # Loads the repos for the organization
    $scope.loadRepos = ->
        repos_url = 'https://api.github.com/orgs/Muhlenberg/repos'
        $http.get(repos_url).success (repos) ->
            $scope.repos = repos

    $scope.loadMembers()
    $scope.loadRepos()

    return
]
