@custom_culibraries_bundle
Feature: Add Library Search Block

    When I login to a Web Express website
    As an authenticated user with the right permission
    I should be able to place a Library Search Block

    Scenario Outline: An authenticated user should be able to access the form for placing a Library Search Block
        Given  I am logged in as a user with the <role> role
        When I go to "admin/structure/block/manage/"
        Then I should see <message>

        Examples:
            | role            | message                  |
            | edit_my_content | "Access Denied"          |
            | edit_only       | "Access Denied"          |
            | content_editor  | "Access Denied"          |
            | site_owner      | "Access Denied"          |
            | administrator   | "Access Denied"          |
            | developer       | "Large Libraries Search" |

    Scenario: An anonymous user should not be able to access the form for placing a Library Search Block
        When I am on "admin/structure/block/manage/"
        Then I should see "Access denied"