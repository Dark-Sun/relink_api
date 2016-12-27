require "faker"

FactoryGirl.define do

  factory :job, class: Hash do
    defaults = {
      company_name: "OppaSuperCode",
      company_url:  "super.code",
      title:        "Super Dev Needed ASAP!",
      description:  "blah-blah",
      location:     {
        name:   Faker::Address.country + " " + Faker::Address.city,
        cc:     Faker::Address.country_code,
        coords: {
          lat: Faker::Address.latitude.to_f,
          lon: Faker::Address.longitude.to_f
        }
      },
      specific_skills: ["Ruby, Rails, React"], # Optional
      expires: (DateTime.now + 20).strftime('%a, %d %b %Y %H:%M:%S %z') # Optional
    }

    initialize_with { defaults.merge(attributes).stringify_keys! }
  end

  factory :profile, class: Hash do
    defaults = {
      "name": "Philip Marlowe",
      "title": "Hardboild Detective",
      "location": {
          "name": "Los Angeles, California",
          "cc": "US",
          "coords": {
              "lat": -34.3254356,
              "lon": -54.895
          }
      },
      "summary": "",
      "positions": [
        {
          "title": "Private Investigator",
          "summary": "",
          "location": {
              "name": "Los Angeles, California",
              "cc": "US",
              "coords": {
                  "lat": -34.3254356,
                  "lon": -54.895
              }
          },
          "startDate": "Mon, 30 May 2016 09:04:55 +0000",
          "endDate": "Mon, 30 May 2016 09:04:55 +0000",
          "company": {
              "name": "Private Investigator",
              "url": "https://philipmarlowe.com/"
          }
        }
      ],
      "email": "darksundarksun@gmail.com",
      "coverLetter": "",
      "skills": [
        "Critical Thinking",
        "Badassedness"
      ],
      "educations": [
        {
            "degree": "bachelor",
            "startDate": "Mon, 30 May 2016 09:04:55 +0000",
            "endDate": "Mon, 30 May 2016 09:04:55 +0000",
            "fieldOfStudy": "Detective stuff",
            "schoolName": "Detective School",
            "summary": ""
        }
      ]
    }

    initialize_with { defaults.merge(attributes).stringify_keys! }
  end
end
