- [Section 1: Introduction](#section-1-introduction)
- [Section 2: Jira Concepts You Need to Know in Jira](#section-2-jira-concepts-you-need-to-know-in-jira)
  - [What is Jira?](#what-is-jira)
  - [Jira Terms You Need to Know](#jira-terms-you-need-to-know)
    - [Issues and Projects](#issues-and-projects)
- [Section 3: Team-Managed Projects](#section-3-team-managed-projects)
    - [Team-Managed Projects](#team-managed-projects)
      - [Navigating](#navigating)
- [Section 4: Company-Managed Projects](#section-4-company-managed-projects)
    - [Company-Managed Projects](#company-managed-projects)
      - [Navigating](#navigating-1)
- [Sectiion 5: Jira's Administrative Back End](#sectiion-5-jiras-administrative-back-end)
  - [Users In Java](#users-in-java)
  - [Understanding Work Flows](#understanding-work-flows)
  - [Schemes](#schemes)

# Section 1: Introduction
Please check the instructor files for the introduction material.

# Section 2: Jira Concepts You Need to Know in Jira

## What is Jira?
Jira is a project management and issue tracking tool. It works on the basis that the users are following the agile methodology.

## Jira Terms You Need to Know

### Issues and Projects
- Issues: Containers for fields
  - Fields: Hold your data i.e a description, summary or due date
- Projects: Containers for issues

# Section 3: Team-Managed Projects

### Team-Managed Projects
All entities live inside the project. They only live in here and cannot be shared amongst other team-managed projects. Project scope entities.
- Entities: Issue types, statuses, resolutions etc. 

#### Navigating
**Roadmap**: A simplified, high-level view of the project's timeline and milestones, allowing the team to plan and track upcoming work.

**Board**: A Kanban or Scrum board where team members can visualize and manage their workflow, with issues moving through columns representing different statuses.

**Code**: Integration with version control repositories, linking commits, branches, and pull requests to Jira issues for enhanced visibility.

**Project Pages**: A place for team documentation or resources related to the project, often integrated with Confluence for sharing information within the team.

**Project Settings**: A project-specific settings area where the team can configure workflows, issue types, and permissions according to their needs.

# Section 4: Company-Managed Projects

### Company-Managed Projects
Entites can be shared across other company-managed projects. Global scope entities.

#### Navigating
**Roadmap**: A high-level timeline view showing planned work, useful for tracking project milestones and strategic goals.

**Backlog**: A prioritized list of tasks or issues, allowing teams to manage upcoming work and prepare items for the sprint.

**Active Sprints**: Displays the issues currently in the sprint, helping teams track progress and update issue statuses as work progresses.

**Reports**: Various reports like Burndown, Velocity, and Sprint Reports that provide insights into team performance and progress over time.

**Issues**: A list view of all issues in the project, which can be filtered and sorted for detailed issue management.

**Components**: Subsections or parts of a project used to organize and group issues, often representing different features, teams, or functional areas.

**Code**: Integration with repositories to link code changes directly to Jira issues, enabling better traceability of development work.

**Releases**: Used for managing versions or releases, tracking progress, and associating issues with specific software releases.

**Project Pages**: A space for documentation or additional project resources, often integrated with Confluence for collaboration.

**Project Settings**: The central area for configuring project-specific settings like workflows, permissions, and notifications.

# Sectiion 5: Jira's Administrative Back End

## Users In Java
What you pay for is how many users have product access.

## Understanding Work Flows
TO DO --> IN PROGRESS --> DONE
- Between each stage, movement is called a transition
- Control said transitions and statuses

## Schemes
Schemes are the link between configuration and company-managed projects. 