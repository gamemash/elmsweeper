import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


main =
  Html.beginnerProgram { model = [1,2,3], view = view, update = update }

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      1 :: model

    Decrement ->
      List.drop 2 model

stylesheet = 
  let 
    tag = "link"
    attrs =
      [ attribute "rel"     "stylesheet"
      , attribute "property"  "stylesheet"
      , attribute "href" "base.css"
      ]
    children = []
  in 
    node tag attrs children


view model =
  div []
    [
    div [id "outer"] [stylesheet]
    , button [ onClick Decrement ] [ text "less" ]
    , div [ class "tile" ] []
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "more" ]
    ]

