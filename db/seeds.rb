# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Question.create(
    title: 'What reasons are you looking to get involved in extracurricular activities?',
    options: {
      'Academic' => ['Academic', 'Campus Departments', 'Departmental Organizations', 'Professional'],
      'Advocacy' => ['Academic', 'Cultural & Ethnic', 'Environmental & Sustainability', 'Health & Wellness', 'LGBTQ+', 'Political & Advocacy', 'Professional', 'RRC', 'Service'],
      'Creativity' => ['Arts', 'Media & Film', 'Performing Arts', 'Publication', 'Recreational'],
      'Culture & Identity' => ['Academic', 'Arts', 'CalGreeks', 'Cultural & Ethnic', 'Ethnic Studies', 'International', 'LGBTQ+', 'Performing Arts', 'RRC', 'Service', "Women's Interests"],
      'Professional Development' => ['Academic', 'Campus Departments', 'Professional', 'Service', 'Technology'],
      'Public Service' => ['Academic', 'Cultural & Ethnic', 'Environmental & Sustainability', 'Health & Wellness', 'Political & Advocacy', 'Professional', 'RRC', 'Service'],
      'Social' => ['Academic', 'Arts', 'CalGreeks', 'Cultural & Ethnic', 'Environmental', 'Health & Wellness', 'Professional', 'Recreational', 'Service'],
      'Spiritual' => ['Cultural & Ethnic', 'Health & Wellness', 'Spiritual'],
      'Student Government(ASUC/GA)' => ['ASUC Coalition/Commission', 'ASUC Government Offices', 'ASUC Government Programs', 'GA Government Offices', 'GA Government Projects'],
      'Technology' => ['Academic', 'Professional', 'Service', 'Technology']
    },
    next_question: {
      'Academic' => 2,
      'Advocacy' => 3,
      'Creativity' => 4,
      'Culture & Identity' => 5,
      'Professional Development' => 6,
      'Public Service' => 7,
      'Social' => 8,
      'Spiritual' => 9,
      'Student Government(ASUC/GA)' => 10,
      'Technology' => 11
    },
    question_type: 'categories'
  )
  Question.create(
    title: 'Based on your interest in Academics, what are you specifically looking for:',
    options: {
      'Academic Advocacy' => ['Academic','Advocacy','Environmental', 'Social Activism', 'Sustainability'],
      'Academic Enrichment' => ['Academic', 'Academic - Honor Society', 'Educational'],
      'Business Orientation' => ['Academic', 'Business', 'Entreprenuerial', 'Professional Development', 'Technology'],
      'Career Planning' => ['Academic', 'Academic - Pre-Professional', 'Career Planning', 'Medical', 'Engineering', 'Professional Development', 'Law'],
      'Leadership Opportunities' => ['Academic', 'Leadership', 'Professional Development'],
      'Major Oriented Orgs' => ['Academic', 'Academic - Departmental', 'Engineering', 'Medical', 'Law'],
      'Research' => ['Academic', 'Academic - Research'],
      'Service' => ['Academic', 'Community Service', 'Service - Community Involvement', 'Service - Outreach'],
      'Social Environments' => ['Academic', 'Social'],
    },
    next_question: {
      'Academic Advocacy' => nil,
      'Academic Enrichment' => nil,
      'Business Orientation' => nil,
      'Career Planning' => nil,
      'Leadership Opportunities' => nil,
      'Major Oriented Orgs' => nil,
      'Research' => nil,
      'Service' => nil,
      'Social Environments' => nil,
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Advocacy, what are you specifically looking for:',
    options: {
      'Cultural/Ethnic' => ['Advocacy', 'Cultural', 'Ethnic', 'Multicultural', 'Native American'],
      'Educational' => ['Advocacy', 'Educational'],
      'Environment & Sustainability' => ['Advocacy', 'Environmental', 'Environmental Groups', 'Sustainability'],
      'Faith, Religion, & Spiritual' => ['Advocacy', 'Faith, Religion, & Spiritual'],
      'Gender & Sexuality' => ['Advocacy', 'Gender & Sexuality', 'Gender and Lesbian, Gay, Bisexual and Transgender Groups', 'Intersections of Identity', 'LGBTQI'],
      'Health & Wellness' => ['Advocacy', 'Health & wellness', 'Engineering', 'Medical', 'Law'],
      'Political' => ['Advocacy', 'Democracy', 'Political', 'Politically Affiliated'],
      'Publications & Media' => ['Advocacy', 'Journals', 'Publications'],
      'Service' => ['Advocacy', 'Community Service', 'Fundraising & Philanthropy'],
      'Social Activism' => ['Advocacy', 'Law', 'Social Activism']
    },
    next_question: {
      'Cultural/Ethnic' => nil,
      'Educational' => nil,
      'Environment & Sustainability' => nil,
      'Faith, Religion, & Spiritual' => nil,
      'Gender & Sexuality' => nil,
      'Health & Wellness' => nil,
      'Political' => nil,
      'Publications & Media' => nil,
      'Service' => nil,
      'Social Activism' => nil,
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Creativity, what are you specifically looking for:',
    options: {
      'Cultural/Ethnic' => ['Advocacy', 'Cultural', 'Ethnic', 'Multicultural', 'Native American'],
      'Educational' => ['Advocacy', 'Educational'],
      'Environment & Sustainability' => ['Advocacy', 'Environmental', 'Environmental Groups', 'Sustainability'],
      'Faith, Religion, & Spiritual' => ['Advocacy', 'Faith, Religion, & Spiritual'],
      'Gender & Sexuality' => ['Advocacy', 'Gender & Sexuality', 'Gender and Lesbian, Gay, Bisexual and Transgender Groups', 'Intersections of Identity', 'LGBTQI'],
      'Health & Wellness' => ['Advocacy', 'Health & wellness', 'Engineering', 'Medical', 'Law'],
      'Political' => ['Advocacy', 'Democracy', 'Political', 'Politically Affiliated'],
      'Publications & Media' => ['Advocacy', 'Journals', 'Publications'],
      'Service' => ['Advocacy', 'Community Service', 'Fundraising & Philanthropy'],
      'Social Activism' => ['Advocacy', 'Law', 'Social Activism']
    },
    next_question: {
      'Cultural/Ethnic' => nil,
      'Educational' => nil,
      'Environment & Sustainability' => nil,
      'Faith, Religion, & Spiritual' => nil,
      'Gender & Sexuality' => nil,
      'Health & Wellness' => nil,
      'Political' => nil,
      'Publications & Media' => nil,
      'Service' => nil,
      'Social Activism' => nil,
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Culture & Identity, what are you specifically looking for:',
    options: {
      'Activism and Advocacy' => ['Cultural', 'Ethnic', 'Advocacy', 'Intersections of Identity', 'Leadership', 'Political', 'Social Activism'],
      'Education' => ['Cultural', 'Ethnic', 'Academic', 'Career Planning', 'Educational'],
      'Expression (Arts, Media)' => ['Cultural', 'Ethnic', 'Arts - Dance', 'Arts - Music', 'Media'],
      'Faith, Religion, & Spiritual' => ['Cultural', 'Ethnic', 'Faith, Religion, & Spiritual'],
      'Retention and Outreach' => ['Cultural', 'Ethnic', 'Intersections of Identity', 'LGBTQI', 'Service - Outreach', 'Service - Retention'],
      'Service' => ['Cultural', 'Ethnic', 'Community Service', 'Service - Community Involvement', 'Service - Outreach', 'Service - Retention'],
      'Sexuality' => ['Cultural', 'Ethnic', 'Gender & Sexuality ', 'Intersections of Identity', 'LGBTQI'],
      'Social Community' => ['Cultural', 'Ethnic', 'Fun!', 'Social']
    },
    next_question: {
      'Activism and Advocacy' => nil,
      'Education' => nil,
      'Expression (Arts, Media)' => nil,
      'Faith, Religion, & Spiritual' => nil,
      'Retention and Outreach' => nil,
      'Service' => nil,
      'Sexuality' => nil,
      'Social Community' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Professional Development, what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Public Service what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Social, what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Spiritual, what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Student Government, what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  Question.create(
    title: 'Based on your interest in Technology, what are you specifically looking for:',
    options: {
      'Business' => [],
      'Education, Development, & Career Planning' => [],
      'Identity' => [],
      'Media' => [],
      'Pre-Professional' => [],
      'Representation and Advocacy' => [],
      'Social Community' => [],
      'Technology' => []
    },
    next_question: {
      'Business' => nil,
      'Education, Development, & Career Planning' => nil,
      'Identity' => nil,
      'Media' => nil,
      'Pre-Professional' => nil,
      'Representation and Advocacy' => nil,
      'Social Community' => nil,
      'Technology' => nil
    },
    question_type: 'interests'
  )
  User.create(
    first_name: 'Tony',
    last_name: 'Li',
    gender: 'Male',
    major: 'IEOR',
    grad_year: '2020',
    ethnicity: 'East Asian',
    transfer: false,
    graduate: false,
    international: false
  )
