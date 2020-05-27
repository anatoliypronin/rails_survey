export function authenticityToken () {
  const token = document.querySelector('meta[name="csrf-token"]')
  return token ? token.content : null
}

function headers () {
  return {
    Accept: '*/*',
    'content-Type': 'application/json',
    'X-CSRF-Token': authenticityToken(),
    'X-Requested-With': 'XMLHttpRequest'
  }
}

export function fetchQuestions(survey) {
  return fetch(Routes.api_v1_survey_questions_path({survey_id: survey, format: 'json'}))
}

export function postFetchQuestionsChoice(data){
  return fetch(Routes.api_v1_choices_path(), {
    method: 'post',
    headers: headers(),
    body: JSON.stringify(data)
  });
}